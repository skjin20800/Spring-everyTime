


























































if (!_set) var _set = {};
_set = _.extend(_set, {
	weeks: ['월', '화', '수', '목', '금', '토', '일'],
	firstTime: 108,
	colors: (function () {
		var colors = [];
		for (var i = 1; i <= 30; i++) colors.push('color' + i);
		return colors;
	})(),
	year: 0,
	semester: '',
	hasSyllabus: false,
	hasSubjectDatabase: false,
	tableId: 0
});

if (!_gfn) var _gfn = {};
_gfn = _.extend(_gfn, {
	resizeContainer: function () {
		var $container = $('#container');
		var $aside = $container.find('aside');
		var $wrap = $container.find('div.wrap');
		var $thead = $container.find('table.tablehead');
		var $tbody = $container.find('table.tablebody');
		var $theadTr = $thead.find('tr');
		var $tbodyTr = $tbody.find('tr');
		var $floating = $container.find('ul.floating');

		// 토, 일 표시/숨김
		if ($tbodyTr.find('td:eq(6) > div.cols').is(':empty')) {
			$theadTr.find('td:eq(6)').hide();
			$tbodyTr.find('td:eq(6)').hide();
			if ($tbodyTr.find('td:eq(5) > div.cols').is(':empty')) {
				$theadTr.find('td:eq(5)').hide();
				$tbodyTr.find('td:eq(5)').hide();
			} else {
				$theadTr.find('td:eq(5)').show();
				$tbodyTr.find('td:eq(5)').show();
			}
		} else {
			$theadTr.find('td:eq(6)').show();
			$tbodyTr.find('td:eq(6)').show();
			$theadTr.find('td:eq(5)').show();
			$tbodyTr.find('td:eq(5)').show();
		}

		// 좌표 조정
		var $tbodyTd = $tbody.find('tr > td:visible');
		var containerHeight = $(window).height() - $container.offset().top - ($container.innerHeight() - $container.height());
		if ($('body').is(':has(#subjects)') && $('#subjects').is(':visible')) {
			containerHeight -= $('#subjects').outerHeight();
		}
		$container.height(containerHeight);
		if ($aside.is(':visible') && $container.width() !== $aside.width()) {
			var wrapWidth = $container.find('hr').width() - $aside.width() - 15;
			$wrap.width(wrapWidth);
		} else {
			$wrap.width('100%');
		}
		$tbodyTd.find('div.cols').each(function () {
			var $colsDiv = $(this);
			$colsDiv.width($colsDiv.parent().outerWidth() - 1);
		});
		var startTime = _set.firstTime;
		$tbody.find('div.subject, div.hour').each(function () {
			var $div = $(this);
			var position = _gfn.getPositionForTime($div.data('startTime'), $div.data('endTime'));
			$div.css({
				height: position.height,
				top: position.top
			});
			if ($div.hasClass('subject')) {
				$div.css('height', '+=1px');
				if ($div.data('startTime') < startTime) startTime = $div.data('startTime');
			} else if ($div.hasClass('hour')) {
				$div.css('line-height', position.height + 'px');
			}
		});

		// 1교시 이전 표시/숨김
		var startTop = - _gfn.getPositionForTime(startTime).top - 2;
		$tbody.css('margin-top', startTop);

		// 추가 버튼 좌표 조정
		var floatingLeft = $wrap.offset().left + ($wrap.width() - $floating.width()) / 2;
		$floating.css('left', floatingLeft);
	},
	getPositionForTime: function (startTime, endTime) {
		var height = 0;
		var top = 0;
		var $container = $('#container');
		var $tbody = $container.find('table.tablebody');
		var $timesDiv = $tbody.find('tbody div.times');
		var $timeDiv = $timesDiv.find('div').filter(function () {
			return $(this).data('startTime') <= startTime;
		}).last();
		if ($timeDiv.length > 0) {
			var timeHeight = $timeDiv.outerHeight();
			if (_set.firstTime % 12 !== 0) timeHeight *= 2; // 30분 기준이므로 1시간 기준으로 변경
			top = Math.floor(timeHeight * (startTime - $timeDiv.data('startTime')) / 12) + $timeDiv.offset().top - $timesDiv.offset().top;
			if (endTime) height = timeHeight * (endTime - startTime) / 12;
		}
		return {
			height: height,
			top: top
		};
	},
	insertSubjectIntoTable: function (subject, callback) {
		var $container = $('#container');
		var $tbodyWrap = $container.find('div.tablebody');
		var $colsDivs = $tbodyWrap.find('table.tablebody div.cols');
		var $nontimesDiv = $tbodyWrap.find('div.nontimes');

		// color 정보 체크
		var color;
		for (var i in _set.colors) {
			if (!$colsDivs.is(':has(div.' + _set.colors[i] + ')')) {
				color = _set.colors[i];
				break;
			}
		}
		if (!color) {
			alert(_set.colors.length + '개 이상 수업을 추가할 수 없습니다.');
			return false;
		}

		// 이미 추가한 수업 체크
		var $insertedSubjects = $tbodyWrap.find('div.subject').filter(function () {
			return $(this).data('id') === subject.id;
		});
		if ($insertedSubjects.length > 0) {
			alert('이미 추가한 수업입니다.');
			return;
		}

		// 중복 시간 체크
		for (var i in subject.times) {
			var time = subject.times[i];
			var $overlappedDivs = $colsDivs.find('div.subject').filter(function () {
				var $div = $(this);
				return $div.data('day') === time.day && $div.data('startTime') < time.endtime && $div.data('endTime') > time.starttime;
			});
			if ($overlappedDivs.length > 0) {
				alert(subject.name + ' 수업과 같은 시간에 이미 수업이 있습니다');
				return false;
			}
		}

		// 테이블에 수업 추가
		for (var i in subject.times) {
			var time = subject.times[i];

			// 셀 만들기
			var $colsDiv = $colsDivs.eq(time.day);
			var $subjectDiv = $('<div></div>').data({
				'id': subject.id,
				'credit': subject.credit,
				'day': time.day,
				'startTime': time.starttime,
				'endTime': time.endtime
			}).addClass('subject ' + color).appendTo($colsDiv);
			$('<h3></h3>').text(subject.name).appendTo($subjectDiv);
			var $p = $('<p></p>').appendTo($subjectDiv);
			$('<em></em>').text(subject.professor).appendTo($p);
			$('<span></span>').text(time.place).appendTo($p);
			var $status = $('<ul></ul>').addClass('status').prependTo($subjectDiv);
			if (subject.id < 0) {
				$('<li></li>').attr('title', '변경').addClass('edit').appendTo($status);
			}
			$('<li></li>').attr('title', '삭제').addClass('del').appendTo($status);
		}

		// 시간이 정해지지 않은 수업 추가
		if (!subject.times.length) {
			var $nontimeDiv = $('<div></div>').data({
				'id': subject.id,
				'credit': subject.credit
			}).addClass('subject');
			$('<span></span>').addClass('name').text(subject.name).appendTo($nontimeDiv);
			if (subject.place) {
				$('<span></span>').addClass('place').text(subject.place).appendTo($nontimeDiv);
			}
			if ($('body').is(':has(#subjects)')) {
				$('<span></span>').addClass('del').attr('title', '삭제').appendTo($nontimeDiv);
			}
			$nontimeDiv.appendTo($nontimesDiv);
		}

		// 학점 갱신
		if ($('#tableCredit')) $('#tableCredit').text(Number($('#tableCredit').text()) + subject.credit);

		_gfn.resizeContainer();
		if (callback) {
			callback();
		}
	},
	deleteSubjectInTable: function (id, callback) {
		var $container = $('#container');
		var $tbodyWrap = $container.find('div.tablebody');
		var $subjectDivs = $tbodyWrap.find('div.subject').filter(function () {
			return $(this).data('id') === id;
		});

		// 학점 갱신
		if ($('#tableCredit')) $('#tableCredit').text(Number($('#tableCredit').text()) - $subjectDivs.data('credit'));

		// 테이블에서 수업 삭제
		$subjectDivs.remove();

		_gfn.resizeContainer();
		if (callback) {
			callback();
		}
	},
	previewSubjectInTable: function (subject) {
		var $container = $('#container');
		var $tbody = $container.find('table.tablebody');
		var $colsDivs = $tbody.find('div.cols');
		$colsDivs.find('div.preview').remove();
		if (subject) {
			for (var i in subject.times) {
				var time = subject.times[i];
				var position = _gfn.getPositionForTime(time.starttime, time.endtime);
				var $colsDiv = $colsDivs.eq(time.day);
				var $subjectDiv = $('<div></div>').css({
					height: position.height,
					top: position.top
				}).addClass('subject preview').appendTo($colsDiv);
				$('<h3></h3>').text(subject.name).appendTo($subjectDiv);
				var $p = $('<p></p>').appendTo($subjectDiv);
				$('<em></em>').text(subject.professor).appendTo($p);
				$('<span></span>').text(time.place).appendTo($p);
			}
		}
	}
});

$().ready(function () {
	var $container = $('#container');
	var $aside = $container.find('aside');
	var $title = $aside.find('div.title');
	var $menu = $aside.find('div.menu > ol');
	var $theadWrap = $container.find('div.wrap > div.tablehead');
	var $tbodyWrap = $container.find('div.wrap > div.tablebody');
	var $floating = $container.find('ul.floating');

	var _fn = {
		initiate: function () {
			if (typeof _timetableGridInfo !== 'undefined' && _timetableGridInfo.length > 0) {
				$.each(_timetableGridInfo, function (i, grid) {
					if (grid.hidden === false) {
						_set.firstTime = grid.rows[0];
						return false;
					}
				});
			}
			$(window).resize(function () {
				_gfn.resizeContainer();
			});
			_fn.initiateContent();
			$(window).on('load', function () { // Fix popstate issue in Safari
				setTimeout(function () {
					$(window).on('popstate', function () {
						_fn.initiateContent();
					});
				}, 0);
			});
			$menu.on('click', 'a[href]', function (event) {
				_fn.goLinkContent(this, event);
			});
			$menu.on('click', 'a.create', function () {
				_fn.makeNewTable();
			});
			if ($('body').is(':has(#subjects)') || $('body').is(':has(#customsubjects)')) {
				$tbodyWrap.on('mouseenter', 'table.tablebody div.subject', function () {
					$(this).find('ul.status').show();
				}).on('mouseleave', 'table.tablebody div.subject', function () {
					$(this).find('ul.status').hide();
				});
				$tbodyWrap.on('click', 'div.subject .del', function () {
					var $subject = $(this).parents('div.subject');
					if (confirm('이 수업을 삭제하시겠습니까?')) {
						_gfn.deleteSubjectInTable($subject.data('id'), function () {
							_gfn.save(_set.tableId, $('#tableName').text());
						});
					}
				});
			}
			if ($('body').is(':has(#semesters)')) {
				$('#semesters').on('change', function () {
					var data = $(this).find('option:selected').data();
					var url = '/timetable/' + data.year + '/' + data.semester;
					_fn.goRedirectContent(url);
				}).on('blur', function () {
					$aside.find('form.select').removeClass('visible');
				});
				$aside.find('#semestersButton').on('click', function () {
					$aside.find('form.select').addClass('visible');
					$('#semester').focus();
				});
			}
		},
		initiateContent: function () {
			var url = location.pathname;
			var params = _fn.parseParams(url);
			_fn.loadContent(params);
		},
		goLinkContent: function (that, event) {
			event.stopPropagation();
			if (typeof history.pushState === 'undefined') {
				return false;
			}
			var url = $(that).attr('href');
			if (url.indexOf('wizard') !== -1) {
				return false;
			}
			event.preventDefault();
			var params = _fn.parseParams(url);
			_fn.loadContent(params);
			history.pushState(null, null, url);
		},
		goRedirectContent: function (url) {
			if (typeof history.pushState === 'undefined') {
				location.href = url;
				return false;
			}
			var params = _fn.parseParams(url);
			_fn.loadContent(params);
			history.pushState(null, null, url);
		},
		parseParams: function (url) {
			/*
				/timetable/2016/1/12345
				/timetable/2016/1
				/timetable
				/@identifier
			*/
			var params = {};
			var paths = _.filter(url.split('/'), function (path) {
				return path !== '';
			});
			if (paths[0] === 'timetable') {
				params.mode = 'timetable';
				if (paths.length >= 3) {
					params.year = Number(paths[1]);
					params.semester = decodeURI(paths[2]);
				}
				if (paths.length === 4) {
					params.id = Number(paths[3]);
				}
			} else if (paths[0][0] === '@') {
				params.mode = 'friend';
				params.identifier = paths[0].substr(1);
			}
			return params;
		},
		loadContent: function (params) {
			if (params.mode === 'timetable') {
				_fn.loadContentTimetable(params);
			} else if (params.mode === 'friend') {
				_fn.loadFriend(params);
			}
		},
		loadContentTimetable: function (params) {
			_fn.loadSemesters(function () {
				var $semesterItems = $('#semesters').find('option');
				var $currentSemester;
				if (params.year && params.semester) {
					$currentSemester = $semesterItems.filter(function () {
						var data = $(this).data();
						return data.year === params.year && data.semester === params.semester;
					});
					if (!$currentSemester.length) {
						_fn.goRedirectContent('/timetable');
						return false;
					}
				} else {
					var nowDate = Math.floor(_serverTime / 86400000) * 86400000;
					var dateDiff = 0;
					$semesterItems.each(function () {
						var $this = $(this);
						var data = $this.data();
						var endDate = Date.parse(data.endDate);
						var diff = endDate - nowDate;
						if (diff >= 0 && (dateDiff === 0 || diff < dateDiff)) {
							dateDiff = diff;
							$currentSemester = $this;
						}
					});
					if (!$currentSemester || !$currentSemester.length) {
						return false;
					}
				}
				var year = $currentSemester.data('year');
				var semester = $currentSemester.data('semester');
				if (_set.year !== year || _set.semester !== semester) {
					_set.year = year;
					_set.semester = semester;
					_set.hasSyllabus = $currentSemester.data('hasSyllabus');
					_set.hasSubjectDatabase = $currentSemester.data('hasSubjectDatabase');
					$currentSemester.prop('selected', true);
					$menu.empty();
					$floating.empty();
					if ($currentSemester.data('isSupported') === true) {
						$('#tableCredit').parent().show();
						$('<li></li>').addClass('button search').text('수업 목록에서 검색').appendTo($floating);
						$('<li></li>').addClass('button custom').text('직접 추가').appendTo($floating);
					} else {
						$('#tableCredit').parent().hide();
						$('<li></li>').addClass('button custom only').text('새 수업 추가').appendTo($floating);
					}
					_gfn.resizeContainer();
					$('#customsubjects').find('a.close').click();
					if ($('body').is(':has(#subjects)')) {
						$('#subjects').find('a.reset').click();
					}
				}
				_fn.loadTableList(function () {
					if (params.id) {
						_set.tableId = params.id;
					} else {
						var $primaryMenu = $menu.find('li').filter(function () {
							return $(this).data('isPrimary') === true;
						});
						if ($primaryMenu.length) {
							_set.tableId = $primaryMenu.data('id');
						} else {
							_fn.makeNewTable();
							return false;
						}
					}
					var $currentMenu = $menu.find('li').filter(function () {
						return $(this).data('id') === _set.tableId;
					});
					$currentMenu.siblings().removeClass('active');
					$currentMenu.addClass('active');
					$('#tableName').text($currentMenu.data('name'));
					$('#tableUpdatedAt').text(_gfn.formatRelativeDate($currentMenu.data('updatedAt')));
					$('#tableCredit').text('0');
					_fn.loadTable();
				});
			});
		},
		loadSemesters: function (callback) {
			if ($('body').is(':has(#semesters)')) {
				var $semesters = $('#semesters');
				if ($semesters.is(':not(:has(option))')) {
					_fn.ajaxSemesters(function (data) {
						_fn.createSemesters(data);
						callback();
					});
				} else {
					callback();
				}
			} else {
				callback();
			}
		},
		ajaxSemesters: function (callback) {
			$.ajax({
				url: _apiServerUrl + '/find/timetable/subject/semester/list',
				xhrFields: {withCredentials: true},
				type: 'POST',
				success: function (data) {
					callback(data);
				}
			});
		},
		createSemesters: function(data) {
			var $semesters = $('#semesters');
			$(data).find('semester').each(function () {
				var $this = $(this);
				$('<option></option>').data({
					year: Number($this.attr('year')),
					semester: $this.attr('semester'),
					startDate: $this.attr('start_date'),
					endDate: $this.attr('end_date'),
					isSupported: ($this.attr('is_supported') === '1' ? true : false),
					hasSyllabus: ($this.attr('has_syllabus') === '1' ? true : false),
					hasSubjectDatabase: ($this.attr('has_subject_database') === '1' ? true : false)
				}).text($this.attr('year') + '년 ' + $this.attr('semester') + '학기').appendTo($semesters);
			});
			$menu.empty();
		},
		loadTableList: function (callback) {
			if ($menu.is(':empty')) {
				_fn.ajaxTableList(function (data) {
					_fn.createTableList(data);
					callback();
				});
			} else {
				callback();
			}
		},
		ajaxTableList: function (callback) {
			$.ajax({
				url: _apiServerUrl + '/find/timetable/table/list/semester',
				xhrFields: {withCredentials: true},
				type: 'POST',
				data: {
					year: _set.year,
					semester: _set.semester
				},
				success: function (data) {
					var responseCode;
					if (!$(data).find('response').children().length) {
						responseCode = $(data).find('response').text();
					}
					if (responseCode === '-1') {
						alert('시간표 목록을 불러올 수 없습니다.');
						return false;
					}
					callback(data);
				}
			});
		},
		createTableList: function (data) {
			$(data).find('table').each(function () {
				var $this = $(this);
				var url = '/timetable/' + _set.year + '/' + _set.semester + '/' + $this.attr('id');
				var $li = $('<li></li>').data({
					id: Number($this.attr('id')),
					name: $this.attr('name'),
					priv: $this.attr('priv'),
					isPrimary: ($this.attr('is_primary') === '1' ? true : false),
					updatedAt: $this.attr('updated_at')
				});
				var $a = $('<a></a>').attr('href', url).text($this.attr('name')).appendTo($li);
				if ($this.attr('is_primary') === '1') {
					$a.addClass('primary');
				}
				$li.appendTo($menu);
			});
			var $extensionLi = $('<li></li>').addClass('extension').appendTo($menu);
			$('<a></a>').addClass('create').text('새 시간표 만들기').appendTo($extensionLi);
			if ($('#semesters').find('option:selected').data('isSupported') === true) {
				$('<a></a>').addClass('wizard').attr('href', '/timetable/wizard/' + _set.year + '/' + _set.semester).text('마법사로 시간표 만들기').appendTo($extensionLi);
			}
		},
		loadTable: function () {
			_fn.createTableLayout();
			_fn.ajaxTable(function (data) {
				_fn.createTable(data);
			});
		},
		ajaxTable: function (callback) {
			var parameters = {
				id: _set.tableId
			};
			if ($('body').is(':has(#friendToken)')) {
				parameters.userid = $('#friendToken').val();
			}
			$.ajax({
				url: _apiServerUrl + '/find/timetable/table',
				xhrFields: {withCredentials: true},
				type: 'POST',
				data: parameters,
				success: function (data) {
					var responseCode;
					if (!$(data).find('response').children().length) {
						responseCode = $(data).find('response').text();
					}
					if (responseCode === '-1') {
						alert('시간표를 불러올 수 없습니다.');
						return false;
					} else if (responseCode === '-2') {
						alert('친구만 볼 수 있는 시간표입니다.');
						return false;
					}
					callback(data);
				}
			});
		},
		createTable: function (data) {
			$(data).find('table > subject').each(function () {
				var $subject = $(this);
				if ($subject.find('closed').attr('value') === '1' && $('body').is(':has(#subjects)')) {
					alert($subject.find('name').attr('value') + ' 수업이 아래와 같은 이유로 삭제되었습니다.\n-수업이 폐강 또는 이름이 변경됨.\n-해당 수업의 카테고리가 변경됨.');
				}
				var subject = {
					id: Number($subject.attr('id')),
					code: $subject.find('internal').attr('value'),
					name: $subject.find('name').attr('value'),
					professor: $subject.find('professor').attr('value'),
					credit: Number($subject.find('credit').attr('value')),
					place: $subject.find('place').attr('value'),
					times: $.map($subject.find('time > data'), function (data) {
						return {
							starttime: Number($(data).attr('starttime')),
							endtime: Number($(data).attr('endtime')),
							day: Number($(data).attr('day')),
							place: $(data).attr('place')
						};
					})
				};
				_gfn.insertSubjectIntoTable(subject);
			});
		},
		createTableLayout: function () {
			$theadWrap.empty();
			$tbodyWrap.empty();
			var $thead = $('<table></table>').addClass('tablehead').appendTo($theadWrap);
			var $tbody = $('<table></table>').addClass('tablebody').appendTo($tbodyWrap);
			var $theadTr = $('<tr></tr>').appendTo($thead);
			var $tbodyTr = $('<tr></tr>').appendTo($tbody);

			// 요일 생성
			$.each(_set.weeks, function (i, week) {
				$('<td></td>').text(week).appendTo($theadTr);
				var $tbodyTd = $('<td></td>').appendTo($tbodyTr);
				$('<div></div>').addClass('cols').appendTo($tbodyTd);
			});
			var $colsDivs = $tbodyTr.find('div.cols');

			// 교시, 시간 생성
			var $hoursTh = $('<th></th>'); // 교시
			var $timesTh = $('<th></th>'); // 시간
			var $hoursDiv = $('<div></div>').addClass('hours').appendTo($hoursTh);
			var $timesDiv = $('<div></div>').addClass('times').appendTo($timesTh);
			var $gridsDivs = $('<div></div>').addClass('grids').insertAfter($colsDivs);
			if (typeof _timetableGridInfo !== 'undefined' && _timetableGridInfo.length > 0) {
				$('<th></th>').prependTo($theadTr);
				$('<th></th>').appendTo($theadTr);
				$hoursTh.prependTo($tbodyTr);
				$timesTh.appendTo($tbodyTr);
			} else {
				$('<th></th>').prependTo($theadTr);
				$timesTh.prependTo($tbodyTr);
			}
			if (_set.firstTime % 12 === 0) { // 1교시가 정각일 경우 1시간 단위로 처리
				for (var time = 0; time < 288; time += 12) {
					var text = '오전 ' + (time / 12) + '시';
					if (time == 144) text = '오후 12시';
					else if (time >= 156) text = '오후 ' + (time / 12 - 12) + '시';
					$('<div></div>').text(text).addClass('time').data({
						'startTime': time,
						'endTime': time + 12
					}).appendTo($timesDiv);
					$('<div></div>').addClass('grid').appendTo($gridsDivs);
				}
			} else { // 1교시가 정각이 아닐 경우 30분 단위로 처리 (ex. 9:30)
				for (var time = 0; time < 288; time += 6) {
					var hTime = Math.floor(time / 12);
					var mTime = time % 12 * 5;
					if (hTime < 10) hTime = '0' + hTime;
					if (mTime < 10) mTime = '0' + mTime;
					var text = hTime + ':' + mTime;
					$('<div></div>').text(text).addClass('time small').data({
						'startTime': time,
						'endTime': time + 6
					}).appendTo($timesDiv);
					$('<div></div>').addClass('grid small').appendTo($gridsDivs);
				}
			}
			if (typeof _timetableGridInfo !== 'undefined' && _timetableGridInfo.length > 0) {
				$.each(_timetableGridInfo, function (i, grid) {
					var hour = grid.no;
					var rows = grid.rows;
					var startTime = rows[0];
					var endTime = rows[rows.length - 1];
					if (!isNaN(hour) && Number(hour) < 0) return;
					var text = (hour !== '') ? (hour + '교시') : '';
					$('<div></div>').text(text).addClass('hour').data({
						'hour': hour,
						'startTime': startTime,
						'endTime': endTime
					}).appendTo($hoursDiv);
				});
			}

			// 시간이 정해지지 않은 수업 영역
			$('<div></div>').addClass('nontimes').appendTo($tbodyWrap);

			_gfn.resizeContainer();
		},
		createTableEmptyLayout: function (message) {
			$theadWrap.empty();
			$tbodyWrap.empty();
			var $empty = $('<div></div>').addClass('empty');
			$('<p></p>').text(message).appendTo($empty);
			$empty.appendTo($theadWrap);
			_gfn.resizeContainer();
		},
		makeNewTable: function () {
			var $container = $('#container');
			var $aside = $container.find('aside');
			var $menu = $aside.find('div.menu > ol');
			var tableName;
			for (var i = 1; ; i += 1) {
				tableName = '시간표 ' + i;
				var $exist = $menu.find('li').filter(function () {
					return $(this).data('name') === tableName;
				});
				if (!$exist.length) {
					break;
				}
			}
			_fn.createTableLayout();
			_gfn.save(0, tableName, function (tableId) {
				$menu.empty();
				var url = '/timetable/' + _set.year + '/' + _set.semester + '/' + tableId;
				_fn.goRedirectContent(url);
			});
		},
		loadFriend: function (params) {
			var identifier = params.identifier;
			var friendInfo = $menu.is(':empty').toString();
			_fn.ajaxFriend(identifier, friendInfo, function (data) {
				if ($(data).find('user').length > 0) {
					_fn.createFriendTitle(identifier, data);
				}
				if ($(data).find('primaryTables').length > 0) {
					_fn.createFriendTableList(data);
				}
				$menu.find('li').removeClass('active');
				var $table = $(data).find('table');
				if ($table.attr('identifier')) {
					$menu.find('li').filter(function () {
						return $(this).data('identifier') === $table.attr('identifier');
					}).addClass('active');
				}
				if ($table.attr('status') === '-1') {
					_fn.createTableEmptyLayout($table.attr('year') + '년 ' + $table.attr('semester') + '학기 시간표가 없습니다');
				} else if ($table.attr('status') === '-2') {
					_fn.createTableEmptyLayout('공개되지 않은 시간표입니다');
				} else {
					_fn.createTableLayout();
					_fn.createTable(data);
				}
			});
		},
		ajaxFriend: function (identifier, friendInfo, callback) {
			$.ajax({
				url: _apiServerUrl + '/find/timetable/table/friend',
				xhrFields: {withCredentials: true},
				type: 'POST',
				data: {
					identifier: identifier,
					friendInfo: friendInfo
				},
				success: function (data) {
					var responseCode;
					if (!$(data).find('response').children().length) {
						responseCode = $(data).find('response').text();
					}
					if (responseCode === '-1') {
						alert('존재하지 않는 시간표입니다.');
						location.href = '/';
						return false;
					}
					callback(data);
				}
			});
		},
		createFriendTitle: function (identifier, data) {
			var $user = $(data).find('user');
			$('<h1></h1>').html($user.attr('name')).appendTo($title);
			if ($user.attr('isMine') && $user.attr('isFriend')) {
				if ($user.attr('isMine') === '1') {
				} else if ($user.attr('isFriend') === '1') {
					var $buttons = $('<ol></ol>').addClass('buttons threecols').appendTo($title);
					var $li = $('<li></li>').appendTo($buttons);
					$('<a></a>').attr('id', 'friendRemove').data('identifier', identifier).addClass('light').text('친구 삭제').appendTo($li);
				} else {
					var $buttons = $('<ol></ol>').addClass('buttons').appendTo($title);
					var $li = $('<li></li>').appendTo($buttons);
					$('<a></a>').attr('id', 'friendRequestButton').data('identifier', identifier).text('친구 요청').appendTo($li);
				}
			}
			$('<hr>').appendTo($title);
		},
		createFriendTableList: function (data) {
			var $primaryTables = $(data).find('primaryTables > primaryTable');
			$primaryTables.each(function () {
				var $this = $(this);
				var url = '/@' + $this.attr('identifier');
				var text = $this.attr('year') + '년 ' + $this.attr('semester') + '학기';
				var $li = $('<li></li>').data('identifier', $this.attr('identifier')).appendTo($menu);
				var $a = $('<a></a>').attr('href', url).text(text).appendTo($li);
			});
		}
	};
	_fn.initiate();
});