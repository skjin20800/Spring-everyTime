


























































$().ready(function () {
	var $container = $('#container');
	var $customsubjects;

	var _fn = {
		initiate: function () {
			if ($('body').is(':has(#customsubjects)')) {
				$customsubjects = $('#customsubjects');
			} else {
				return false;
			}
			$container.find('ul.floating').on('click', 'li.custom', function () {
				_fn.open();
			});
			$container.find('div.wrap > div.tablebody').on('click', 'table.tablebody div.subject ul.status li.edit', function () {
				var id = $(this).parents('div.subject').data('id');
				_fn.close();
				_fn.openToEdit(id);
			});
			$customsubjects.find('a.close').on('click', function () {
				_fn.close();
			});
			_fn.addTimeplace();
			$customsubjects.find('dd.timeplaces a.new').on('click', function () {
				_fn.addTimeplace();
			});
			$customsubjects.find('dd.timeplaces').on('click', 'a.remove', function () {
				_fn.removeTimeplace($(this).parent());
			});
			$customsubjects.on('submit', function () {
				_fn.submit();
				return false;
			});
		},
		resize: function () {
			if (!$customsubjects || $customsubjects.is(':not(:visible)')) {
				return false;
			}
			if ($container.width() < 640) {
				_fn.close();
				return false;
			}
			var $wrap = $container.find('div.wrap');
			var left = $wrap.offset().left + ($wrap.width() - $customsubjects.outerWidth()) / 2;
			$customsubjects.css('left', left);
		},
		open: function () {
			$customsubjects.find('h2').text('새 수업 추가');
			$customsubjects.show();
			_fn.resize();
		},
		openToEdit: function (id) {
			var $timeplaces = $customsubjects.find('dd.timeplaces');
			var $tbody = $container.find('table.tablebody');
			var $subjectDivs = $tbody.find('div.subject').filter(function () {
				return $(this).data('id') === id;
			});
			var id = $subjectDivs.eq(0).data('id');
			var name = $subjectDivs.eq(0).find('h3').text();
			var professor = $subjectDivs.eq(0).find('p > em').text();
			$customsubjects.find('input[name="id"]').val(id);
			$customsubjects.find('input[name="name"]').val(name);
			$customsubjects.find('input[name="professor"]').val(professor);
			$subjectDivs.each(function (index) {
				if (index > 0) _fn.addTimeplace();
				var $timeplace = $timeplaces.find('div.timeplace').last();
				var $subjectDiv = $(this);
				var day = $subjectDiv.data('day');
				var startHour = Math.floor($subjectDiv.data('startTime') / 12);
				var startMinute = ($subjectDiv.data('startTime') % 12) * 5;
				var endHour = Math.floor($subjectDiv.data('endTime') / 12);
				var endMinute = ($subjectDiv.data('endTime') % 12) * 5;
				var place = $subjectDiv.find('p > span').text();
				$timeplace.find('ol.weeks > li').eq(day).click();
				$timeplace.find('p > select.starthour').val(startHour).change();
				$timeplace.find('p > select.startminute').val(startMinute).change();
				$timeplace.find('p > select.endhour').val(endHour).change();
				$timeplace.find('p > select.endminute').val(endMinute).change();
				$timeplace.find('p > input.place').val(place);
			});
			$customsubjects.find('h2').text('수업 정보 변경');
			$customsubjects.show();
			_fn.resize();
		},
		close: function () {
			$customsubjects[0].reset();
			$customsubjects.find('input[name="id"]').val('');
			$customsubjects.find('div.timeplace').remove();
			$customsubjects.find('dd.timeplaces a.new').show();
			_fn.addTimeplace();
			$customsubjects.hide();
		},
		addTimeplace: function () {
			if (!_set || !_set.weeks) return false;
			var $timeplaces = $customsubjects.find('dd.timeplaces');
			var $timeplace = $('<div></div>').addClass('timeplace').insertBefore($timeplaces.find('a.new'));
			// 요일 선택
			var $weeks = $('<ol></ol>').addClass('weeks').appendTo($timeplace);
			$.each(_set.weeks, function (i, week) {
				$('<li></li>').text(week).data('day', i).appendTo($weeks);
			});
			$weeks.find('li:first-child').addClass('active');
			$weeks.on('click', 'li', function () {
				var $week = $(this);
				$week.siblings('li.active').removeClass('active');
				$week.addClass('active');
			});
			if ($timeplace.index() > 0) {
				$('<a></a>').text('삭제').addClass('remove').appendTo($timeplace);
				$timeplace.hide().fadeIn(300);
			}
			// 시간 선택
			var $p = $('<p></p>').appendTo($timeplace);
			var $startHourSelect = $('<select></select>').addClass('starthour').appendTo($p);
			var $startMinuteSelect = $('<select></select>').addClass('startminute').appendTo($p);
			for (var h = 0; h < 12; h += 1) {
				$('<option></option>').val(h).text('오전 ' + h + '시').appendTo($startHourSelect);
			}
			$('<option></option>').val(12).text('오후 12시').appendTo($startHourSelect);
			for (var h = 13; h < 24; h += 1) {
				$('<option></option>').val(h).text('오후 ' + (h - 12) + '시').appendTo($startHourSelect);
			}
			for (var m = 0; m < 60; m += 5) {
				$('<option></option>').val(m).text(m + '분').appendTo($startMinuteSelect);
			}
			$('<span></span>').text('~').appendTo($p);
			var $endHourSelect = $startHourSelect.clone().removeClass().addClass('endhour').appendTo($p);
			var $endMinuteSelect = $startMinuteSelect.clone().removeClass().addClass('endminute').appendTo($p);

			$startHourSelect.find('option[value="9"]').attr('selected', true);
			$endHourSelect.find('option[value="10"]').attr('selected', true);
			$startHourSelect.on('change', function () {
				var startHour = Number($startHourSelect.val());
				var endHour = Number($endHourSelect.val());
				if (startHour > endHour) {
					if (startHour >= 23) $endHourSelect.val(23);
					else $endHourSelect.val(startHour + 1);
				}
			});
			$endHourSelect.on('change', function () {
				var startHour = Number($startHourSelect.val());
				var endHour = Number($endHourSelect.val());
				if (endHour < startHour) {
					if (endHour <= 1) $startHourSelect.val(0);
					else $startHourSelect.val(endHour - 1);
				}
			});
			// 장소 입력
			$('<input>').attr({
				type: 'text',
				placeholder: '예) 종303'
			}).addClass('text place').appendTo($p);
			if ($timeplaces.find('div.timeplace').length >= 5) {
				$timeplaces.find('a.new').hide();
			}
		},
		removeTimeplace: function ($timeplace) {
			var $timeplaces = $timeplace.parent();
			if ($timeplaces.find('div.timeplace').length <= 5) {
				$timeplaces.find('a.new').show();
			}
			$timeplace.remove();
		},
		trim: function (text) {
			return text.replace(/^\s+|\s+$/gm, '');
		},
		submit: function () {
			var $colsDivs = $container.find('table.tablebody div.cols');
			var $name = $customsubjects.find('input[name="name"]');
			var $professor = $customsubjects.find('input[name="professor"]');
			var $timeplaces = $customsubjects.find('dd.timeplaces');
			var id = Number($customsubjects.find('input[name="id"]').val());
			var data = {
				'name': _fn.trim($name.val()),
				'professor': _fn.trim($professor.val()),
				'time_place': []
			};
			if (data.name === '') {
				alert('과목명을 입력하세요!');
				$name.focus();
				return false;
			}
			var startTimeError = false;
			var overlappedTimeError = false;
			$timeplaces.find('div.timeplace').each(function () {
				var $timeplace = $(this);
				var day = $timeplace.find('ol.weeks > li.active').data('day');
				var startHour = Number($timeplace.find('select.starthour').val());
				var startMinute = Number($timeplace.find('select.startminute').val());
				var endHour = Number($timeplace.find('select.endhour').val());
				var endMinute = Number($timeplace.find('select.endminute').val());
				var startTime = startHour * 12 + startMinute / 5;
				var endTime = endHour * 12 + endMinute / 5;
				if (startTime >= endTime) startTimeError = true;
				data['time_place'].push({
					'day': day,
					'starttime': startTime,
					'endtime': endTime,
					'place': _fn.trim($timeplace.find('input.place').val())
				});
				var $overlappedDivs = $colsDivs.find('div.subject').filter(function () {
					var $div = $(this);
					return $div.data('id') !== id && $div.data('day') === day && $div.data('startTime') < endTime && $div.data('endTime') > startTime;
				});
				if ($overlappedDivs.length > 0) overlappedTimeError = true;
			});
			if (startTimeError) {
				alert('시작시간은 종료시간보다 더 빨라야 합니다!');
				return false;
			} else if (overlappedTimeError) {
				alert('같은 시간에 이미 수업이 있습니다!');
				return false;
			} else if (data['time_place'].length === 0) {
				alert('시간을 입력하세요!');
				return false;
			}
			if (!id) {
				_fn.ajaxAddCustomSubject(data);
			} else {
				_fn.ajaxUpdateCustomSubject(-id, data);
			}
		},
		ajaxAddCustomSubject: function (data) {
			$.ajax({
				url: _apiServerUrl + '/save/timetable/subject/custom',
				xhrFields: {withCredentials: true},
				type: 'POST',
				data: {
					data: JSON.stringify(data)
				},
				success: function (response) {
					var subjectId = Number($('response', response).text());
					if (subjectId > 0) {
						_fn.insertSubject(subjectId, data);
					} else {
						alert('수업을 추가할 수 없습니다.');
					}
				},
				statusCode: {
					401: function () {
						alert('로그인 후 이용해주세요!');
					}
				}
			});
		},
		ajaxUpdateCustomSubject: function (subjectId, data) {
			$.ajax({
				url: _apiServerUrl + '/update/timetable/subject/custom',
				xhrFields: {withCredentials: true},
				type: 'POST',
				data: {
					subject_id: subjectId,
					data: JSON.stringify(data)
				},
				success: function (response) {
					subjectId = Number($('response', response).text());
					if (subjectId > 0) {
						_gfn.deleteSubjectInTable(-subjectId, function () {
							_fn.insertSubject(subjectId, data);
						});
					} else {
						alert('수업을 수정할 수 없습니다.');
					}
				},
				statusCode: {
					401: function () {
						alert('로그인 후 이용해주세요!');
					}
				}
			});
		},
		insertSubject: function (subjectId, data) {
			var subject = {
				id: -subjectId,
				code: '',
				name: data.name,
				professor: data.professor,
				credit: 0,
				place: '',
				times: data['time_place']
			};
			_gfn.insertSubjectIntoTable(subject, function () {
				_fn.close();
				_gfn.save(_set.tableId, $('#tableName').text());
			});
		}
	};
	_fn.initiate();

	$(window).resize(function () {
		_fn.resize();
	});

});