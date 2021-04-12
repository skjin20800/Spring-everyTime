


























































$().ready(function() {
	var $aside = $('aside:first');
	var $container = $('#container');
	var $tableExport, $tableSetting, $insertTime;

	var _fn = {
		initiate: function() {
			_fn.initiateTableExport();
			_fn.initiateTableSetting();
			_fn.initiateInsertTime();
		},
		initiateInsertTime: function() {
			$insertTime = $('#insertTime');
			$('[data-modal="insertTime"]').on('click', function() {
				_fn.showInsertTime();
			});
			$('a.close', $insertTime).on('click', function() {
				_fn.hideInsertTime();
			});
			$insertTime.on('submit', function() {
				_fn.saveInsertTime();
				return false;
			});
		},
		showInsertTime: function() {
			var $menu = $aside.find('div.menu > ol');
			var $name = $insertTime.find('input[name="name"]');
			var $priv = $insertTime.find('input[name="priv"]');
			var $isPrimary = $insertTime.find('input[name="is_primary"]');
			var $currentMenu = $menu.find('li').filter(function() {
				return $(this).data('id') === _set.tableId;
			});
			var tableName = $currentMenu.data('name');
			var tablePriv = $currentMenu.data('priv');
			var tableIsPrimary = $currentMenu.data('isPrimary');
			$name.val(tableName);
			$priv.filter('[value="' + tablePriv + '"]').click();
			if (tableIsPrimary === true) {
				$isPrimary.prop('checked', true).prop('disabled', true);
			} else {
				$isPrimary.prop('checked', false).prop('disabled', false);
			}
			$insertTime.show();
		},
		hideInsertTime: function() {
			$insertTime.hide();
		},
		saveInsertTime: function() {
			var timetableId = $("#timetableId").val();
			var lectureLength = document.getElementsByName("lecbox").length;
			for (var i = 0; i < lectureLength; i++) {
				if (document.getElementsByName("lecbox")[i].checked == true) {
					lectureId = document.getElementsByName("lecbox")[i].value;
				}
			}
			// 시간표 이름 저장
			$.ajax({
				type: 'POST',
				url: '/timetable/insert/' + timetableId+'/'+lectureId
			}).done((res) => {
				if (res.statusCode === 1) {
					alert("시간표 추가에 성공하였습니다.");
					location.reload();
				} else {
					alert("시간표 추가에 실패하였습니다.");
				}
			});
		},

		initiateTableExport: function() {
			$tableExport = $('#tableExport');
			$('[data-modal="tableExport"]').on('click', function() {
				_fn.showTableExport();
			});
			$('a.close', $tableExport).on('click', function() {
				_fn.hideTableExport();
			});
			$tableExport.on('submit', function() {
				var $submit = $tableExport.find('input[type="submit"]');
				$submit.attr('disabled', true).val('이미지 생성 중입니다. 잠시만 기다려주세요.');
				var isMobile = ($tableExport.find('input[name="is_mobile"]:checked').val() === 'true') ? true : false;
				_fn.getExportImage(isMobile, function(canvas) {
					$.getScript("/js/extensions.FileSaver.min.js", function() {
						$.getScript("/js/extensions.canvas-toBlob.js", function() {
							canvas.toBlob(function(blob) {
								saveAs(blob, "everytime.png");
							});
							$submit.attr('disabled', false).val('저장하기');
							_fn.hideTableExport();
						});
					});
				});
				return false;
			});
		},
		showTableExport: function() {
			$tableExport.show();
		},
		hideTableExport: function() {
			$tableExport.hide();
		},
		getExportImage: function(isMobile, callback) {
			var $tbody = $container.find('table.tablebody');
			var subjects = $tbody.find('div.subject').map(function() {
				var $subject = $(this);
				return {
					id: $subject.data('id'),
					name: $subject.find('h3').text(),
					professor: $subject.find('p > em').text(),
					place: $subject.find('p > span').text(),
					day: $subject.data('day'),
					startTime: $subject.data('startTime'),
					endTime: $subject.data('endTime')
				};
			}).get();
			_timetableImageGenerator.generate(subjects, isMobile, function(canvas) {
				callback(canvas);
			});
		},
		initiateTableSetting: function() {
			$tableSetting = $('#tableSetting');
			$('[data-modal="tableSetting"]').on('click', function() {
				_fn.showTableSetting();
			});
			$('a.close', $tableSetting).on('click', function() {
				_fn.hideTableSetting();
			});
			$tableSetting.on('submit', function() {
				_fn.saveTableSetting();
				return false;
			});
			$tableSetting.find('input.button[value="삭제"]').on('click', function() {
				_fn.removeTable();
			});
		},
		showTableSetting: function() {
			var $menu = $aside.find('div.menu > ol');
			var $name = $tableSetting.find('input[name="name"]');
			var $priv = $tableSetting.find('input[name="priv"]');
			var $isPrimary = $tableSetting.find('input[name="is_primary"]');
			var $currentMenu = $menu.find('li').filter(function() {
				return $(this).data('id') === _set.tableId;
			});
			var tableName = $currentMenu.data('name');
			var tablePriv = $currentMenu.data('priv');
			var tableIsPrimary = $currentMenu.data('isPrimary');
			$name.val(tableName);
			$priv.filter('[value="' + tablePriv + '"]').click();
			if (tableIsPrimary === true) {
				$isPrimary.prop('checked', true).prop('disabled', true);
			} else {
				$isPrimary.prop('checked', false).prop('disabled', false);
			}
			$tableSetting.show();
		},
		hideTableSetting: function() {
			$tableSetting.hide();
		},
		saveTableSetting: function() {
			var $menu = $aside.find('div.menu > ol');
			var $name = $tableSetting.find('input[name="name"]');
			var $priv = $tableSetting.find('input[name="priv"]');
			var $isPrimary = $tableSetting.find('input[name="is_primary"]');
			var newName = $.trim($name.val().replace(/\//g, ''));
			var newPriv = $priv.filter(':checked').val();
			var newIsPrimary = $isPrimary.is(':checked') ? true : false;
			var $currentMenu = $menu.find('li').filter(function() {
				return $(this).data('id') === _set.tableId;
			});
			var tableName = $currentMenu.data('name');
			var tablePriv = $currentMenu.data('priv');
			var tableIsPrimary = $currentMenu.data('isPrimary');
			var response;
			// 시간표 이름 저장
			if (newName !== tableName) {
				if (!newName) {
					alert('이름을 입력해주세요.');
					$name.focus();
					return false;
				}
				$.ajax({
					url: _apiServerUrl + '/update/timetable/table/name',
					xhrFields: { withCredentials: true },
					type: 'POST',
					data: {
						data: _set.tableId + '/' + newName
					},
					async: false,
					success: function(data) {
						response = Number($(data).find('response').text());
					},
					statusCode: {
						401: function() {
							response = 0;
						}
					}
				});
				if (response === -3) {
					alert('이미 존재하는 이름입니다.');
					$name.focus();
					return false;
				} else if (response < 1) {
					alert('이름을 변경할 수 없습니다.');
					return false;
				}
			}
			// 공개 범위 저장
			if (newPriv !== tablePriv) {
				$.ajax({
					url: _apiServerUrl + '/update/timetable/table/private',
					xhrFields: { withCredentials: true },
					type: 'POST',
					data: {
						id: _set.tableId,
						priv: newPriv
					},
					async: false,
					success: function(data) {
						response = Number($(data).find('response').text());
					},
					statusCode: {
						401: function() {
							response = 0;
						}
					}
				});
				if (response < 1) {
					alert('권한을 변경할 수 없습니다.');
					return false;
				}
			}
			// 기본 시간표 설정
			if (newIsPrimary !== tableIsPrimary) {
				$.ajax({
					url: _apiServerUrl + '/update/timetable/table/primary',
					xhrFields: { withCredentials: true },
					type: 'POST',
					data: {
						id: _set.tableId
					},
					async: false,
					success: function(data) {
						response = Number($(data).find('response').text());
					},
					statusCode: {
						401: function() {
							response = 0;
						}
					}
				});
				if (response < 1) {
					alert('기본 시간표를 변경할 수 없습니다.');
					return false;
				}
			}
			alert('저장하였습니다.');
			location.reload();
		},
		removeTable: function() {
			if (confirm('시간표를 삭제하시겠습니까?')) {
				_gfn.remove(_set.tableId, function() {
					location.href = '/timetable/' + _set.year + '/' + _set.semester;
				});
			}
		}
	};
	_fn.initiate();
});