


























































if (!_gfn) var _gfn = {};
_gfn = _.extend(_gfn, {
	save: function (tableId, tableName, callback) {
		var $container = $('#container');
		var $tbodyWrap = $container.find('div.tablebody');
		var subjects = '';
		var data;
		if (!tableId) tableId = '0';
		tableName = $.trim(tableName.replace(/\//g, ''));
		var subjectIds = $tbodyWrap.find('div.subject').map(function () {
			return $(this).data('id');
		});
		subjectIds = _.uniq(subjectIds);
		_.each(subjectIds, function (subjectId) {
			subjects += subjectId + '/';
		});
		data = tableName + '/' + _set.year + '/' + _set.semester + '/' + tableId + '/' + subjects;
		$.ajax({
			url: _apiServerUrl + '/save/timetable/table',
			xhrFields: {withCredentials: true},
			type: 'POST',
			data: {
				data: data
			},
			async: false,
			success: function (data) {
				if (callback) {
					var responseCode = Number($(data).find('response').text());
					if (responseCode > 0) {
						callback(responseCode);
					} else {
						callback();
					}
				}
			},
			statusCode: {
				401: function () {
					alert('로그인 후 이용해주세요!');
				}
			}
		});
	},
	remove: function (tableId, callback) {
		$.ajax({
			url: _apiServerUrl + '/remove/timetable/table',
			xhrFields: {withCredentials: true},
			type: 'POST',
			data: {
				id: tableId
			},
			async: false,
			success: function (data) {
				var responseCode = $(data).find('response').text();
				if (responseCode === '-1') {
					alert('시간표를 삭제할 수 없습니다.');
				}
				if (callback) {
					callback();
				}
			},
			statusCode: {
				401: function () {
					alert('로그인 후 이용해주세요!');
				}
			}
		});
	}
});