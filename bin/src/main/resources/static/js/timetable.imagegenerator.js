


























































var _timetableImageGenerator = {
	generate: function (subjects, isMobile, callback) {
		var weekHeight, hourWidth, hourHeight, contentPadding, mediumSize, smallSize;
		if (isMobile) {
			weekHeight = 80;
			hourWidth = 70;
			hourHeight = 180;
			contentPadding = 3;
			mediumSize = 30;
			smallSize = 24;
		} else {
			weekHeight = 40;
			hourWidth = 60;
			hourHeight = 80;
			contentPadding = 3;
			mediumSize = 16;
			smallSize = 13;
		}

		var minTime = 108; // 09:00
		var maxTime = 192; // 16:00
		var lastDay = 4; // 금요일
		if (subjects.length) {
			minTime = Math.floor(_.chain(subjects).map(function (subject) {
				return subject.startTime;
			}).min().value() / 12) * 12;
			maxTime = Math.ceil(_.chain(subjects).map(function (subject) {
				return subject.endTime;
			}).max().value() / 12) * 12;
			if ((maxTime - minTime) / 12 < 6) {
				maxTime = minTime + 6 * 12;
			}
			var lastSubjectDay = _.chain(subjects).map(function (subject) {
				return subject.day;
			}).max().value();
			if (lastDay < lastSubjectDay) {
				lastDay = lastSubjectDay;
			}
		}

		var timeLength = (maxTime - minTime) / 12;
		var canvasWidth = 960;
		var canvasHeight = weekHeight + hourHeight * timeLength;
		var weekWidth = Math.round((canvasWidth - hourWidth) / (lastDay + 1));
		var contentWidth = weekWidth - contentPadding * 2;

		// init canvas
		var $canvas = $('<canvas></canvas>').attr({
			width: canvasWidth,
			height: canvasHeight
		});
		var canvas = $canvas[0];
		var context = canvas.getContext('2d');

		// fill canvas background
		context.fillStyle = '#ffffff';
		context.fillRect(0, 0, canvasWidth, canvasHeight);

		// fill week background
		context.fillStyle = '#f2f2f2';
		context.fillRect(0, 0, canvasWidth, weekHeight);

		// stroke line
		context.strokeStyle = '#e3e3e3';
		context.lineWidth = 1;
		context.beginPath();
		context.moveTo(0.5, 0);
		context.lineTo(0.5, canvasHeight);
		context.stroke();
		context.closePath();
		_.each(_.range(lastDay + 2), function (i) {
			var x = hourWidth + weekWidth * i - 0.5;
			context.beginPath();
			context.moveTo(x, 0);
			context.lineTo(x, canvasHeight);
			context.stroke();
			context.closePath();
		});
		context.beginPath();
		context.moveTo(0, 0.5);
		context.lineTo(canvasWidth, 0.5);
		context.stroke();
		context.closePath();
		_.each(_.range(timeLength + 1), function (i) {
			var y = weekHeight + hourHeight * i - 0.5;
			context.beginPath();
			context.moveTo(0, y);
			context.lineTo(canvasWidth, y);
			context.stroke();
			context.closePath();
		});

		// fill subject background
		var subjectColors = ['#f2e8e8', '#ffe9e9', '#eff9cc', '#dcf2e9', '#dee8f6', '#fff8cc', '#ffedda', '#dceef2'];
		var subjectUsedColors = {};
		_.each(subjects, function (subject) {
			var x = hourWidth + weekWidth * subject.day;
			var y = weekHeight + hourHeight * (subject.startTime - minTime) / 12;
			var width = weekWidth - 1;
			var height = hourHeight * (subject.endTime - subject.startTime) / 12 - 1;
			var color;
			if (subjectUsedColors[subject.id]) {
				color = subjectUsedColors[subject.id];
			} else {
				color = subjectColors[_.size(subjectUsedColors) % 8];
				subjectUsedColors[subject.id] = color;
			}
			context.fillStyle = color;
			context.fillRect(x, y, width, height);
		});

		WebFontConfig = {
			custom: {
				families: ['Noto Sans KR:n4,n5'],
				urls: ['//fonts.googleapis.com/earlyaccess/notosanskr.css'],
				testStrings: {'Noto Sans KR': '테스트'}
			},
			active: function () {
				// fill week text
				context.font = mediumSize + 'px Noto Sans KR';
				context.fillStyle = '#737373';
				context.textAlign = 'center';
				context.textBaseline = 'middle';
				var weekTexts = ['월', '화', '수', '목', '금', '토', '일'].slice(0, lastDay + 1);
				_.each(weekTexts, function (weekText, index) {
					var x = hourWidth + weekWidth * index + (weekWidth / 2);
					var y = weekHeight / 2;
					context.fillText(weekText, x, y);
				});

				// fill hour text
				context.font = smallSize + 'px Noto Sans KR';
				var hourTexts = _.map(_.range(minTime, maxTime, 12), function (time) {
					return (time / 12) + '시';
				});
				_.each(hourTexts, function (hourText, index) {
					var x = hourWidth / 2;
					var y = weekHeight + hourHeight * index + (hourHeight / 2);
					context.fillText(hourText, x, y);
				});

				// fill subject text
				context.textAlign = 'left';
				context.textBaseline = 'top';
				_.each(subjects, function (subject) {
					var subjectHeight = hourHeight * (subject.endTime - subject.startTime) / 12 - 1;
					var subjectY = weekHeight + hourHeight * (subject.startTime - minTime) / 12 + contentPadding;
					var x = hourWidth + weekWidth * subject.day + contentPadding;
					context.font = '500 ' + mediumSize + 'px Noto Sans KR';
					context.fillStyle = '#292929';
					var name = _timetableImageGenerator.tokenizeText(context, subject.name, contentWidth);
					var nameY = subjectY;
					if ((nameY + mediumSize - subjectY) >= subjectHeight) {
						return false;
					}
					context.fillText(name.firstLine, x, nameY);
					if (name.secondLine) {
						var name2Y = nameY + mediumSize + contentPadding;
						if ((name2Y + mediumSize - subjectY) >= subjectHeight) {
							return false;
						}
						context.fillText(name.secondLine, x, name2Y);
					}
					context.font = smallSize + 'px Noto Sans KR';
					context.fillStyle = '#737373';
					var professor = _timetableImageGenerator.tokenizeText(context, subject.professor, contentWidth);
					var professorY = (name.secondLine ? name2Y : nameY) + mediumSize + contentPadding * 2;
					if ((professorY + smallSize - subjectY) >= subjectHeight) {
						return false;
					}
					context.fillText(professor.firstLine, x, professorY);
					var place = _timetableImageGenerator.tokenizeText(context, subject.place, contentWidth);
					var placeY = professorY + (professor.firstLine ? (smallSize + contentPadding) : 0);
					if ((placeY + smallSize - subjectY) >= subjectHeight) {
						return false;
					}
					context.fillText(place.firstLine, x, placeY);
				});
				callback(canvas);
			}
		};
		(function(d) {
			var wf = d.createElement('script'), s = d.scripts[0];
			wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js';
			s.parentNode.insertBefore(wf, s);
		})(document);
	},
	tokenizeText: function (context, text, maxWidth) {
		var result = {
			firstLine: '',
			secondLine: ''
		};
		var isFullFirstLine = false;
		_.each(_.range(1, text.length + 1), function (i) {
			var token, measuredWidth;
			if (!isFullFirstLine) {
				token = text.slice(0, i);
				measuredWidth = context.measureText(token).width;
				if (measuredWidth <= maxWidth) {
					result.firstLine = token.slice(0, token.length);
				} else {
					isFullFirstLine = true;
				}
			} else {
				token = text.slice(result.firstLine.length, i);
				measuredWidth = context.measureText(token).width;
				if (measuredWidth <= maxWidth) {
					result.secondLine = token.slice(0, token.length);
				}
			}
		});
		return result;
	}
};