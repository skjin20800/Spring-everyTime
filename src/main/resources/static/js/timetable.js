//$tbodyWrap.on('click', 'div.subject .del', function() {
//	var $subject = $(this).parents('div.subject');
//	if (confirm('이 수업을 삭제하시겠습니까?')) {
//		alter($subject + "삭제되었습니다.");
//		//						_gfn.deleteSubjectInTable($subject.data('id'), function () {
//		//							_gfn.save(_set.tableId, $('#tableName').text());
//		//						});
//	}
//});
//_gfn = _.extend(_gfn, {
//remove: function (tableId, callback) {
//	$.ajax({
//		url: _apiServerUrl + '/remove/timetable/table',
//		xhrFields: { withCredentials: true },
//		type: 'POST',
//		data: {
//			id: tableId
//		},
//		async: false,
//		success: function(data) {
//			var responseCode = $(data).find('response').text();
//			if (responseCode === '-1') {
//				alert('시간표를 삭제할 수 없습니다.');
//			}
//			if (callback) {
//				callback();
//			}
//		},
//		statusCode: {
//			401: function() {
//				alert('로그인 후 이용해주세요!');
//			}
//		}
//	});
//},
//deleteSubjectInTable: function (id, callback) {
//		var $container = $('#container');
//		var $tbodyWrap = $container.find('div.tablebody');
//		var $subjectDivs = $tbodyWrap.find('div.subject').filter(function () {
//			return $(this).data('id') === id;
//		});
//
//		// 학점 갱신
//		if ($('#tableCredit')) $('#tableCredit').text(Number($('#tableCredit').text()) - $subjectDivs.data('credit'));
//
//		// 테이블에서 수업 삭제
//		$subjectDivs.remove();
//
//		_gfn.resizeContainer();
//		if (callback) {
//			callback();
//		}
//	}
//});

function chageSelect(){
    var langSelect = document.getElementById("semesters");
     
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
 	var year = selectValue.substring(0,4);
 	var semester = selectValue.substring(selectValue.indexOf("년")+2,selectValue.indexOf("학기"));
   location.href = "/timetable/"+year+"/"+semester;
}
