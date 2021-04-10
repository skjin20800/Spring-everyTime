


























































if (!_set) var _set = {};

$().ready(function () {
  var $container = $('#container');
  var $subjects, $notUpdated, $filterItems, $list, $listThead, $listTbody, $listTfoot;
  _set = _.extend(_set, {
    subjectSchoolId: 0,
    subjectCampusId: 0,
    subjectColumnInfo: [],
    hasCapacity: 0,
    hasCredit: 0,
    hasGrade: 0,
    hasType: 0,
    campuses: [],
    isSubjectRendered: false,
    isSubjectLoadCompleted: false,
    subjectLimitNum: 50,
    subjectStartNum: 0,
    subjectFilter: {}
  });

  var _fn = {
    init: function () {
      if ($('body').is(':has(#subjects)')) {
        $subjects = $('#subjects');
        _set.subjectSchoolId = Number($('#userSchool').val());
        _set.subjectCampusId = Number($('#userCampus').val());
        if (_subjectColumnInfo[_set.subjectSchoolId]) {
          _set.subjectColumnInfo = _subjectColumnInfo[_set.subjectSchoolId];
        } else {
          _set.subjectColumnInfo = _subjectColumnInfo[0];
        }
      } else {
        return;
      }

      $(window).on('resize', function () {
        _fn.resize();
      });
      if ($container.hasClass('timetable')) {
        $container.on('click', 'ul.floating > li.search', function () {
          _fn.open();
        });
      } else if ($container.hasClass('wizard')) {
        $container.on('click', 'div.groups > table.group > caption > p.buttons > a.add', function () {
          _fn.open();
        });
      }

      $('#subjectCampusFilter').on('submit', function (e) {
        _fn.onSubmitCampusFilter();
        return false;
      }).on('click', 'a.close', function (e) {
        $('#subjectCampusFilter').hide();
      });

      $('#subjectCategoryFilter').on('click', 'a.close', function (e) {
        $('#subjectCategoryFilter').hide();
      }).on('click', 'li', function () {
        _fn.onClickCategoryFilterItem($(this));
      });

      $('#subjectKeywordFilter').on('submit', function (e) {
        _fn.onSubmitKeywordFilter();
        return false;
      }).on('click', 'a.close', function (e) {
        $('#subjectKeywordFilter').hide();
      });

      $('#subjectOrderFilter').on('submit', function (e) {
        _fn.onSubmitOrderFilter();
        return false;
      }).on('click', 'a.close', function (e) {
        $('#subjectOrderFilter').hide();
      });

      $('#subjectTimeFilter').on('submit', function (e) {
        _fn.onSubmitTimeFilter();
        return false;
      }).on('click', 'a.close', function (e) {
        $('#subjectTimeFilter').hide();
      }).on('click', 'td.time', function () {
        $(this).toggleClass('selected');
      });

      $('#subjectGradeFilter').on('submit', function (event) {
        _fn.onSubmitGradeFilter();
        return false;
      }).on('click', 'a.close', function () {
        $('#subjectGradeFilter').hide();
      }).on('click', 'input[data-action="select"]', function () {
        $('#subjectGradeFilter').find('input[type="checkbox"]:not(:checked)').trigger('click');
      }).on('click', 'input[data-action="deselect"]', function () {
        $('#subjectGradeFilter').find('input[type="checkbox"]:checked').trigger('click');
      });

      $('#subjectTypeFilter').on('submit', function (event) {
        _fn.onSubmitTypeFilter();
        return false;
      }).on('click', 'a.close', function () {
        $('#subjectTypeFilter').hide();
      }).on('click', 'input[data-action="select"]', function () {
        $('#subjectTypeFilter').find('input[type="checkbox"]:not(:checked)').trigger('click');
      }).on('click', 'input[data-action="deselect"]', function () {
        $('#subjectTypeFilter').find('input[type="checkbox"]:checked').trigger('click');
      });

      $('#subjectCreditFilter').on('submit', function (event) {
        _fn.onSubmitCreditFilter();
        return false;
      }).on('click', 'a.close', function () {
        $('#subjectCreditFilter').hide();
      }).on('click', 'input[data-action="select"]', function () {
        $('#subjectCreditFilter').find('input[type="checkbox"]:not(:checked)').trigger('click');
      }).on('click', 'input[data-action="deselect"]', function () {
        $('#subjectCreditFilter').find('input[type="checkbox"]:checked').trigger('click');
      });
    },
    open: function () {
      if (_set.hasSubjectDatabase === false) {
        $subjects.empty().show();
        $notUpdated = $('<div></div>').addClass('notUpdated').appendTo($subjects);
        $('<p></p>').text('아직 업데이트되지 않았습니다').appendTo($notUpdated);
        $('<a></a>').addClass('close').text('닫기').on('click', function () {
          _fn.close();
        }).appendTo($notUpdated);
        $('<a></a>').addClass('reset hide').text('초기화').on('click', function () {
          _fn.reset();
        }).appendTo($notUpdated);
        return;
      }

      setTimeout(function () {
        $subjects.show();
        _gfn.resizeContainer();
        _fn.resize();
      }, 100);

      if ($subjects.is(':not(:empty)')) {
        return;
      }
      $filterItems = $('<div></div>').addClass('filter').appendTo($subjects);
      var $close = $('<a></a>').addClass('close').text('닫기').appendTo($filterItems);
      var $reset = $('<a></a>').addClass('reset hide').text('초기화').appendTo($filterItems);

      $list = $('<div></div>').addClass('list').appendTo($subjects);
      $('<div></div>').addClass('thead').appendTo($list);
      var $listTable = $('<table></table>').appendTo($list);
      $listThead = $('<thead></thead>').appendTo($listTable);
      _fn.appendListThead();
      $listTbody = $('<tbody></tbody>').appendTo($listTable);
      $listTfoot = $('<tfoot></tfoot>').appendTo($listTable);
      var $listTfootTr = $('<tr></tr>').appendTo($listTfoot);
      $('<td></td>').attr('colspan', $listThead.find('tr > th').length).appendTo($listTfootTr);
      _fn.loadFilter(function (data) {
        _fn.appendFilter(data);
        _fn.loadSubjects(true, function (data) {
          _fn.appendSubjects(data);
        });
      });

      $close.on('click', function () {
        _fn.close();
      });
      $reset.on('click', function () {
        _fn.reset();
      });

      $filterItems.on('click', 'a.item[data-id="campus"]', function () {
        _fn.showCampusFilter();
      }).on('click', 'a.item[data-id="category"]', function () {
        _fn.showCategoryFilter();
      }).on('click', 'a.item[data-id="category"] > span.reset', function (event) {
        _fn.resetCategoryFilter();
        event.stopPropagation();
      }).on('click', 'a.item[data-id="keyword"]', function () {
        _fn.showKeywordFilter();
      }).on('click', 'a.item[data-id="keyword"] > span.reset', function (event) {
        _fn.resetKeywordFilter();
        event.stopPropagation();
      }).on('click', 'a.item[data-id="order"]', function () {
        _fn.showOrderFilter();
      }).on('click', 'a.item[data-id="order"] > span.reset', function (event) {
        _fn.resetOrderFilter();
        event.stopPropagation();
      }).on('click', 'a.item[data-id="time"]', function () {
        _fn.showTimeFilter();
      }).on('click', 'a.item[data-id="time"] > span.reset', function (event) {
        _fn.resetTimeFilter();
        event.stopPropagation();
      }).on('click', 'a.item[data-id="grade"]', function () {
        _fn.showGradeFilter();
      }).on('click', 'a.item[data-id="grade"] > span.reset', function (event) {
        _fn.resetGradeFilter();
        event.stopPropagation();
      }).on('click', 'a.item[data-id="type"]', function () {
        _fn.showTypeFilter();
      }).on('click', 'a.item[data-id="type"] > span.reset', function (event) {
        _fn.resetTypeFilter();
        event.stopPropagation();
      }).on('click', 'a.item[data-id="credit"]', function () {
        _fn.showCreditFilter();
      }).on('click', 'a.item[data-id="credit"] > span.reset', function (event) {
        _fn.resetCreditFilter();
        event.stopPropagation();
      });

      $list.on('scroll', function () {
        _fn.onListScroll();
      });

      $listTbody.on('click', 'tr > td:not(:has(a))', function () {
        var $tr = $(this).parent('tr');
        if ($container.hasClass('timetable')) {
          _gfn.insertSubjectIntoTable($tr.data('subject'), function () {
            _gfn.save(_set.tableId, $('#tableName').text());
          });
        } else if ($container.hasClass('wizard')) {
          _gfn.insertSubjectIntoGroup($tr.data('subject'));
        }
      }).on('mouseenter', 'tr > td:not(:has(a))', function () {
        var $tr = $(this).parent('tr');
        if ($container.hasClass('timetable')) {
          _gfn.previewSubjectInTable($tr.data('subject'));
        }
      }).on('mouseleave', 'tr > td:not(:has(a))', function () {
        if ($container.hasClass('timetable')) {
          _gfn.previewSubjectInTable();
        }
      });
    },
    close: function () {
      $subjects.hide();
      _gfn.resizeContainer();
    },
    reset: function () {
      _set.subjectFilter = {};
      $subjects.empty();
      _fn.close();
    },
    resize: function () {
      if ($subjects && $subjects.is(':visible') && $subjects.width() < 640) {
        _fn.close();
      }
    },
    appendListThead: function () {
      var $tr = $('<tr></tr>');
      if (_set.hasSyllabus === true) {
        var $syllabusTh = $('<th></th>').text('계획서').appendTo($tr);
        $('<div></div>').text('계획서').appendTo($syllabusTh);
      }
      _.each(_set.subjectColumnInfo, function (item) {
        var $th = $('<th></th>').text(item.value).appendTo($tr);
        $('<div></div>').text(item.value).appendTo($th);
      });
      $tr.appendTo($listThead);
    },
    resetFilterItem: function (id) {
      if (id === 'category') {
        $filterItems.find('a.item[data-id="category"]').removeClass('active').html('<span class="key">전공/영역:</span><span class="value">전체</span><span class="reset"></span>');
      } else if (id === 'keyword') {
        $filterItems.find('a.item[data-id="keyword"]').removeClass('active').html('<span class="key">검색어:</span><span class="value">없음</span><span class="reset"></span>');
      } else if (id === 'order') {
        $filterItems.find('a.item[data-id="order"]').removeClass('active').html('<span class="key">정렬:</span><span class="value">기본</span><span class="reset"></span>');
      } else if (id === 'time') {
        $filterItems.find('a.item[data-id="time"]').removeClass('active').html('<span class="key">시간:</span><span class="value">전체</span><span class="reset"></span>');
      } else if (id === 'grade') {
        $filterItems.find('a.item[data-id="grade"]').removeClass('active').html('<span class="key">학년:</span><span class="value">전체</span><span class="reset"></span>');
      } else if (id === 'type') {
        $filterItems.find('a.item[data-id="type"]').removeClass('active').html('<span class="key">구분:</span><span class="value">전체</span><span class="reset"></span>');
      } else if (id === 'credit') {
        $filterItems.find('a.item[data-id="credit"]').removeClass('active').html('<span class="key">학점:</span><span class="value">전체</span><span class="reset"></span>');
      }
    },
    loadFilter: function (callback) {
      $.ajax({
        url: _apiServerUrl + '/find/timetable/subject/filter/list',
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
            return;
          }
          callback(data);
        }
      });
    },
    appendFilter: function (data) {
      _set.hasCapacity = Boolean(Number($(data).find('response').attr('hasCapacity')));
      _set.hasCredit = Boolean(Number($(data).find('response').attr('hasCredit')));
      _set.hasGrade = Boolean(Number($(data).find('response').attr('hasGrade')));
      _set.hasType = Boolean(Number($(data).find('response').attr('hasType')));
      _set.campuses = $(data).find('response > campus').map(function () {
        var $campusData = $(this);
        var campus = {
          id: Number($campusData.attr('id')),
          name: $campusData.attr('name')
        };

        var categoryItems = $campusData.find('categories > category').map(function () {
          var $categoryData = $(this);
          return {
            id: Number($categoryData.attr('id')),
            name: $categoryData.attr('name'),
            order: Number($categoryData.attr('order')),
            parentId: Number($categoryData.attr('parentId')) || 0
          };
        }).get();
        categoryItems = _.sortBy(categoryItems, 'order');
        var makeCategories = function (parentId) {
          return _.chain(categoryItems).where({parentId: parentId}).map(function (categoryItem) {
            return {
              id: categoryItem.id,
              name: categoryItem.name,
              categories: makeCategories(categoryItem.id)
            };
          }).value();
        };
        campus.categories = makeCategories(0);

        if ($campusData.is(':has(types)')) {
          var types = $campusData.find('types > type').map(function () {
            var $typeData = $(this);
            return {
              id: Number($typeData.attr('id')),
              name: $typeData.attr('name')
            };
          }).get();
          campus.types = types;
        }
        return campus;
      }).get();

      if (_set.campuses.length === 0) {
        return;
      }
      var campusName;
      var currentCampus = _.findWhere(_set.campuses, {id: _set.subjectCampusId});
      if (currentCampus !== undefined) {
        campusName = currentCampus.name;
      } else {
        _set.subjectCampusId = _set.campuses[0].id;
        campusName = _set.campuses[0].name;
      }
      if (_set.campuses.length > 1) {
        $('<a></a>').addClass('item').attr('data-id', 'campus').html('<span class="key">캠퍼스:</span><span class="value">' + campusName.replace('캠퍼스', '') + '</span>').appendTo($filterItems);
      }
      $('<a></a>').addClass('item').attr('data-id', 'category').appendTo($filterItems);
      _fn.resetFilterItem('category');
      $('<a></a>').addClass('item').attr('data-id', 'keyword').appendTo($filterItems);
      _fn.resetFilterItem('keyword');
      $('<a></a>').addClass('item').attr('data-id', 'order').appendTo($filterItems);
      _fn.resetFilterItem('order');
      $('<a></a>').addClass('item').attr('data-id', 'time').appendTo($filterItems);
      _fn.resetFilterItem('time');
      if (_set.hasGrade === true) {
        $('<a></a>').addClass('item').attr('data-id', 'grade').appendTo($filterItems);
        _fn.resetFilterItem('grade');
      }
      if (_set.hasType === true) {
        $('<a></a>').addClass('item').attr('data-id', 'type').appendTo($filterItems);
        _fn.resetFilterItem('type');
      }
      if (_set.hasCredit === true) {
        $('<a></a>').addClass('item').attr('data-id', 'credit').appendTo($filterItems);
        _fn.resetFilterItem('credit');
      }
    },
    showCampusFilter: function () {
      if (_set.isSubjectRendered === false) {
        return;
      }
      var $filter = $('#subjectCampusFilter').find('div.filter');
      $filter.empty();
      _.each(_set.campuses, function (item) {
        var campus = {
          id: item.id,
          shortText: item.name.replace('캠퍼스', ''),
          fullText: item.name
        };
        var $label = $('<label></label>').appendTo($filter);
        var $radio = $('<input>').attr({type: 'radio', name: 'campus'}).data('campus', campus).appendTo($label);
        if (_set.subjectCampusId === campus.id) {
          $radio.attr('checked', true);
        }
        $('<span></span>').html(campus.fullText).appendTo($label);
      });
      $('#subjectCampusFilter').show();
    },
    onSubmitCampusFilter: function () {
      var $radios = $('#subjectCampusFilter').find('input[type="radio"]');
      var campus = $radios.filter(':checked').data('campus');
      _set.subjectCampusId = campus.id;
      _set.subjectFilter.categoryId = undefined;
      _set.subjectFilter.keyword = undefined;
      _set.subjectFilter.order = undefined;
      _set.subjectFilter.time = undefined;
      _set.subjectFilter.grade = undefined;
      _set.subjectFilter.type = undefined;
      _set.subjectFilter.credit = undefined;
      $filterItems.find('a.item[data-id="campus"] > span.value').html(campus.shortText);
      _fn.resetFilterItem('category');
      _fn.resetFilterItem('keyword');
      _fn.resetFilterItem('order');
      _fn.resetFilterItem('time');
      _fn.resetFilterItem('grade');
      _fn.resetFilterItem('type');
      _fn.resetFilterItem('credit');
      $('#subjectCampusFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    showCategoryFilter: function () {
      if (_set.isSubjectRendered === false) {
        return;
      }
      var $filter = $('#subjectCategoryFilter').find('div.filter');
      $filter.empty();
      var $category = $('<ul></ul>').addClass('category');
      var categories = _.findWhere(_set.campuses, {id: _set.subjectCampusId}).categories;
      function makeCategoryTree(categories, $ul) {
        _.each(categories, function  (category) {
          var $li = $('<li></li>').text(category.name).appendTo($ul);
          if (category.categories.length > 0) {
            $li.addClass('parent folded');
            makeCategoryTree(category.categories, $('<ul></ul>').addClass('folded').appendTo($ul));
          } else {
            $li.addClass('child').data('category', category);
          }
        });
      }
      makeCategoryTree(categories, $category);
      $category.appendTo($filter);
      $('#subjectCategoryFilter').show();
      if (_set.subjectFilter.categoryId) {
        $filter.scrollTop(0);
        $category.find('li.child').each(function () {
          var $li = $(this);
          if (_set.subjectFilter.categoryId === $li.data('category').id) {
            $li.addClass('filtered');
            $li.parents('ul.folded').each(function () {
              var $ul = $(this);
              $ul.removeClass('folded').addClass('unfolded');
              $ul.prev('li.folded').removeClass('folded').addClass('unfolded');
            });
            $filter.scrollTop($li.position().top - $li.outerHeight());
          }
        });
      }
    },
    resetCategoryFilter: function () {
      _set.subjectFilter.categoryId = undefined;
      _fn.resetFilterItem('category');
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    onClickCategoryFilterItem: function ($li) {
      if ($li.is('.parent')) {
        if ($li.is('.folded')) {
          $li.removeClass('folded').addClass('unfolded');
          $li.next('ul').removeClass('folded').addClass('unfolded');
        } else {
          $li.removeClass('unfolded').addClass('folded');
          $li.next('ul').removeClass('unfolded').addClass('folded');
        }
      } else {
        var category = $li.data('category');
        _set.subjectFilter.categoryId = category.id;
        var $filterItem = $filterItems.find('a.item[data-id="category"]').addClass('active');
        $filterItem.find('span.value').html(category.name);
        $('#subjectCategoryFilter').hide();
        _fn.loadSubjects(true, function (data) {
          _fn.appendSubjects(data);
        });
      }
    },
    showKeywordFilter: function () {
      if (_set.isSubjectRendered === false) {
        return;
      }
      var $filter = $('#subjectKeywordFilter').find('div.filter');
      $filter.empty();
      var setType, setKeyword;
      if (_set.subjectFilter.keyword) {
        var setFilter = JSON.parse(_set.subjectFilter.keyword);
        setType = setFilter.type;
        setKeyword = setFilter.keyword;
      } else {
        setType = 'name';
        setKeyword = '';
      }
      var keywordTypes = [{id: 'name', text: '과목명'}, {id: 'professor', text: '교수명'}, {id: 'code', text: '과목코드'}, {id: 'place', text: '장소'}];
      _.each(keywordTypes, function (keywordType) {
        var $label = $('<label></label>').addClass('inline').appendTo($filter);
        var $radio = $('<input>').attr({type: 'radio', name: 'keyword_type'}).data('keywordType', keywordType).appendTo($label);
        if (setType === keywordType.id) {
          $radio.attr('checked', true);
        }
        $('<span></span>').html(keywordType.text).appendTo($label);
      });
      var $keyword = $('<input>').addClass('keyword').attr({type: 'search', name: 'keyword', placeholder: '검색어'}).val(setKeyword).appendTo($filter);
      $('#subjectKeywordFilter').show();
      $keyword.focus();
    },
    resetKeywordFilter: function () {
      _set.subjectFilter.keyword = undefined;
      _fn.resetFilterItem('keyword');
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    onSubmitKeywordFilter: function () {
      var $radios = $('#subjectKeywordFilter').find('input[type="radio"]');
      var $keyword = $('#subjectKeywordFilter').find('input[name="keyword"]');
      var keywordType = $radios.filter(':checked').data('keywordType');
      var keyword = $keyword.val().trim();
      if (keyword.replace(/\s/g, '').length < 2) {
        alert('검색어를 두 글자 이상 입력해주세요.');
        return;
      }
      _set.subjectFilter.keyword = JSON.stringify({type: keywordType.id, keyword: keyword});
      var $filterItem = $filterItems.find('a.item[data-id="keyword"]').addClass('active');
      $filterItem.find('span.key').html(keywordType.text + ':');
      $filterItem.find('span.value').html(keyword);
      $('#subjectKeywordFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    showOrderFilter: function () {
      if (_set.isSubjectRendered === false) {
        return;
      }
      var $filter = $('#subjectOrderFilter').find('div.filter');
      $filter.empty();
      var orders = [
        {id: undefined, text: '기본'},
        {id: 'code', text: '과목코드'},
        {id: 'name', text: '과목명'},
        {id: 'rateDesc', text: '별점 높은순'},
        {id: 'rateAsc', text: '별점 낮은순'},
        {id: 'popularDesc', text: '담은인원 많은순'},
        {id: 'popularAsc', text: '담은인원 적은순'}
      ];
      if (_set.hasCapacity === true) {
        orders.push({id: 'competitionDesc', text: '경쟁률 높은순'});
        orders.push({id: 'competitionAsc', text: '경쟁률 낮은순'});
      }
      _.each(orders, function (order) {
        var $label = $('<label></label>').appendTo($filter);
        var $radio = $('<input>').attr({type: 'radio', name: 'order'}).data('order', order).appendTo($label);
        if (_set.subjectFilter.order === order.id) {
          $radio.attr('checked', true);
        }
        $('<span></span>').html(order.text).appendTo($label);
      });
      $('#subjectOrderFilter').show();
    },
    resetOrderFilter: function () {
      _set.subjectFilter.order = undefined;
      _fn.resetFilterItem('order');
      $('#subjectOrderFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    onSubmitOrderFilter: function () {
      var $radios = $('#subjectOrderFilter').find('input[type="radio"]');
      var order = $radios.filter(':checked').data('order');
      if (order.id === undefined) {
        _fn.resetOrderFilter();
        return;
      }
      _set.subjectFilter.order = order.id;
      var $filterItem = $filterItems.find('a.item[data-id="order"]').addClass('active');
      $filterItem.find('span.value').html(order.text);
      $('#subjectOrderFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    showTimeFilter: function () {
      if (_set.isSubjectRendered === false) {
        return;
      }
      var $filter = $('#subjectTimeFilter').find('div.filter');
      $filter.empty();
      var setTimeFilter = [];
      if (_set.subjectFilter.time) {
        setTimeFilter = JSON.parse(_set.subjectFilter.time);
      }
      $('<span></span>').addClass('description').text('선택한 시간 내에 개설된 과목만 검색합니다.').appendTo($filter);
      var $times = $('<table></table>').addClass('times');
      var $tbody = $('<tbody></tbody>').appendTo($times);
      _.each(_.range(7, 21), function (hour) {
        var start = hour * 12;
        var end = (hour + 1) * 12;
        var $tr = $('<tr></tr>').appendTo($tbody);
        _.each(_.range(-1, 7), function (day) {
          if (hour === 7) {
            var week = '월화수목금토일'.split('')[day] || '';
            $('<td></td>').addClass('week').text(week).appendTo($tr);
          } else if (day === -1) {
            $('<td></td>').addClass('hour').text(hour).appendTo($tr);
          } else {
            var $td = $('<td></td>').addClass('time').data({day: day, start: start, end: end}).appendTo($tr);
            var foundTimeFilter = _.find(setTimeFilter, function (filter) {
              return day === filter.day && start >= filter.start && end <= filter.end;
            });
            if (foundTimeFilter !== undefined) {
              $td.addClass('selected');
            }
          }
        });
      });
      $times.appendTo($filter);
      $('#subjectTimeFilter').show();
    },
    resetTimeFilter: function () {
      _set.subjectFilter.time = undefined;
      _fn.resetFilterItem('time');
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    onSubmitTimeFilter: function () {
      var times = [];
      $('#subjectTimeFilter').find('td.time.selected').each(function () {
        var time = $(this).data();
        var beforeTime = _.findWhere(times, {day: time.day, end: time.start});
        if (beforeTime !== undefined) {
          beforeTime.end = time.end;
          return;
        }
        var afterTime = _.findWhere(times, {day: time.day, start: time.end});
        if (afterTime !== undefined) {
          afterTime.start = time.start;
          return;
        }
        times.push(time);
      });
      times = _.chain(times).sortBy('start').sortBy('day').value();
      if (times.length === 0) {
        alert('시간을 1개 이상 선택해주세요.');
        return;
      }
      _set.subjectFilter.time = JSON.stringify(times);
      var values = _.map(times, function (time) {
        return '월화수목금토일'.split('')[time.day] + (time.start / 12).toString() + '-' + (time.end / 12).toString() + '시';
      });
      var value = values.slice(0, 2).join(', ');
      if (values.length >= 3) {
        value += ' 외 ' + (values.length - 2) + '개';
      }
      var $filterItem = $filterItems.find('a.item[data-id="time"]').addClass('active');
      $filterItem.find('span.value').html(value);
      $('#subjectTimeFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    showGradeFilter: function () {
      if (_set.isSubjectRendered === false) {
        return;
      }
      var $filter = $('#subjectGradeFilter').find('div.filter');
      $filter.empty();
      var setGradeFilter;
      if (_set.subjectFilter.grade) {
        setGradeFilter = JSON.parse(_set.subjectFilter.grade);
      }
      var items = [1, 2, 3, 4, 0];
      _.each(items, function (item) {
        var grade = {
          id: item,
          shortText: (item === 0) ? '기타' : item.toString(),
          fullText: (item === 0) ? '기타' : item.toString() + '학년'
        };
        var $label = $('<label></label>').appendTo($filter);
        var $checkbox = $('<input>').attr({type: 'checkbox', name: 'grade'}).data('grade', grade).appendTo($label);
        if (setGradeFilter === undefined || _.contains(setGradeFilter, grade.id) === true) {
          $checkbox.attr('checked', true);
        }
        $('<span></span>').html(grade.fullText).appendTo($label);
      });
      $('#subjectGradeFilter').show();
    },
    resetGradeFilter: function () {
      _set.subjectFilter.grade = undefined;
      _fn.resetFilterItem('grade');
      $('#subjectGradeFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    onSubmitGradeFilter: function () {
      var $checkboxes = $('#subjectGradeFilter').find('input[type="checkbox"]');
      var grades = $checkboxes.filter(':checked').map(function () {
        return $(this).data('grade');
      }).get();
      if (grades.length === 0) {
        alert('학년을 1개 이상 선택해주세요.');
        return;
      }
      if ($checkboxes.length === grades.length) {
        _fn.resetGradeFilter();
        return;
      }
      _set.subjectFilter.grade = JSON.stringify(_.pluck(grades, 'id'));
      var value = _.pluck(grades, 'shortText').slice(0, 2).join(', ');
      if (grades.length >= 3) {
        value += ' 외 ' + (grades.length - 2) + '개';
      }
      var $filterItem = $filterItems.find('a.item[data-id="grade"]').addClass('active');
      $filterItem.find('span.value').html(value);
      $('#subjectGradeFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    showTypeFilter: function () {
      if (_set.isSubjectRendered === false) {
        return;
      }
      var $filter = $('#subjectTypeFilter').find('div.filter');
      $filter.empty();
      var setTypeFilter;
      if (_set.subjectFilter.type) {
        setTypeFilter = JSON.parse(_set.subjectFilter.type);
      }
      var items = _.findWhere(_set.campuses, {id: _set.subjectCampusId}).types;
      _.each(items, function (item) {
        var type = {
          id: item.id,
          text: item.name
        };
        var $label = $('<label></label>').appendTo($filter);
        var $checkbox = $('<input>').attr({type: 'checkbox', name: 'type'}).data('type', type).appendTo($label);
        if (setTypeFilter === undefined || _.contains(setTypeFilter, type.id) === true) {
          $checkbox.attr('checked', true);
        }
        $('<span></span>').html(type.text).appendTo($label);
      });
      $('#subjectTypeFilter').show();
    },
    resetTypeFilter: function () {
      _set.subjectFilter.type = undefined;
      _fn.resetFilterItem('type');
      $('#subjectTypeFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    onSubmitTypeFilter: function () {
      var $checkboxes = $('#subjectTypeFilter').find('input[type="checkbox"]');
      var types = $checkboxes.filter(':checked').map(function () {
        return $(this).data('type');
      }).get();
      if (types.length === 0) {
        alert('구분을 1개 이상 선택해주세요.');
        return;
      }
      if ($checkboxes.length === types.length) {
        _fn.resetTypeFilter();
        return;
      }
      _set.subjectFilter.type = JSON.stringify(_.pluck(types, 'id'));
      var value = _.pluck(types, 'text').slice(0, 2).join(', ');
      if (types.length >= 3) {
        value += ' 외 ' + (types.length - 2) + '개';
      }
      var $filterItem = $filterItems.find('a.item[data-id="type"]').addClass('active');
      $filterItem.find('span.value').html(value);
      $('#subjectTypeFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    showCreditFilter: function () {
      if (_set.isSubjectRendered === false) {
        return;
      }
      var $filter = $('#subjectCreditFilter').find('div.filter');
      $filter.empty();
      var setCreditFilter;
      if (_set.subjectFilter.credit) {
        setCreditFilter = JSON.parse(_set.subjectFilter.credit);
      }
      var items = _.range(0, 4.5, 0.5);
      _.each(items, function (item) {
        var credit = {
          id: item,
          shortText: item.toString().replace('4', '4~'),
          fullText: item.toString() + '학점' + (item === 4 ? ' 이상' : '')
        };
        var $label = $('<label></label>').appendTo($filter);
        var $checkbox = $('<input>').attr({type: 'checkbox', name: 'credit'}).data('credit', credit).appendTo($label);
        if (setCreditFilter === undefined || _.contains(setCreditFilter, credit.id) === true) {
          $checkbox.attr('checked', true);
        }
        $('<span></span>').html(credit.fullText).appendTo($label);
      });
      $('#subjectCreditFilter').show();
    },
    resetCreditFilter: function () {
      _set.subjectFilter.credit = undefined;
      _fn.resetFilterItem('credit');
      $('#subjectCreditFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    onSubmitCreditFilter: function () {
      var $checkboxes = $('#subjectCreditFilter').find('input[type="checkbox"]');
      var credits = $checkboxes.filter(':checked').map(function () {
        return $(this).data('credit');
      }).get();
      if (credits.length === 0) {
        alert('학점을 1개 이상 선택해주세요.');
        return;
      }
      if ($checkboxes.length === credits.length) {
        _fn.resetCreditFilter();
        return;
      }
      _set.subjectFilter.credit = JSON.stringify(_.pluck(credits, 'id'));
      var value = _.pluck(credits, 'shortText').slice(0, 2).join(', ');
      if (credits.length >= 3) {
        value += ' 외 ' + (credits.length - 2) + '개';
      }
      var $filterItem = $filterItems.find('a.item[data-id="credit"]').addClass('active');
      $filterItem.find('span.value').html(value);
      $('#subjectCreditFilter').hide();
      _fn.loadSubjects(true, function (data) {
        _fn.appendSubjects(data);
      });
    },
    loadSubjects: function (isClear, callback) {
      if (isClear === true) {
        _set.isSubjectLoadCompleted = false;
        _set.subjectStartNum = 0;
        $listTbody.empty();
        $listTfoot.show();
      }
      _set.isSubjectRendered = false;
      _set.subjectFilter = JSON.parse(JSON.stringify(_set.subjectFilter));
      var params = _.extend(_.clone(_set.subjectFilter), {
        campusId: _set.subjectCampusId,
        year: _set.year,
        semester: _set.semester,
        limitNum: _set.subjectLimitNum,
        startNum: _set.subjectStartNum
      });
      $.ajax({
        url: _apiServerUrl + '/find/timetable/subject/list',
        xhrFields: {withCredentials: true},
        type: 'POST',
        data: params,
        success: function (data) {
          var responseCode;
          if (!$(data).find('response').children().length) {
            responseCode = $(data).find('response').text();
          }
          if (responseCode === '-1') {
            return;
          }
          setTimeout(function () {
            callback(data);
          }, 1000);
        }
      });
      if (isClear === true && typeof gtag === 'function') {
        var gtagEventParams = JSON.parse(JSON.stringify({
          'event_category': 'Timetable',
          'event_label': 'Campus' + _set.subjectCampusId,
          'SubjectFilterCategoryId': _set.subjectFilter.categoryId,
          'SubjectFilterKeyword': _set.subjectFilter.keyword,
          'SubjectFilterOrder': _set.subjectFilter.order,
          'SubjectFilterTime': _set.subjectFilter.time,
          'SubjectFilterGrade': _set.subjectFilter.grade,
          'SubjectFilterType': _set.subjectFilter.type,
          'SubjectFilterCredit': _set.subjectFilter.credit
        }));
        gtag('config', 'UA-22022140-4', {'custom_map': {'dimension1': 'SubjectFilterCategoryId', 'dimension2': 'SubjectFilterKeyword', 'dimension3': 'SubjectFilterOrder', 'dimension4': 'SubjectFilterTime', 'dimension5': 'SubjectFilterGrade', 'dimension6': 'SubjectFilterType', 'dimension7': 'SubjectFilterCredit'}});
        gtag('event', 'LoadSubjects', gtagEventParams);
      }
    },
    appendSubjects: function (data) {
      var count = $(data).find('response > subject').length;
      if (count !== _set.subjectLimitNum) {
        $listTfoot.hide();
        _set.isSubjectLoadCompleted = true;
      }
      if (_set.subjectStartNum === 0 && count === 0) {
        var $emptyTr = $('<tr></tr>').addClass('empty').appendTo($listTbody);
        $('<th></th>').text('검색 결과가 없습니다').attr('colspan', $listThead.find('tr > th').length).appendTo($emptyTr);
        _set.isSubjectRendered = true;
        return;
      }
      $(data).find('response > subject').each(function () {
        var $subjectData = $(this);
        var $tr = $('<tr></tr>').data('subject', {
          id: Number($subjectData.attr('id')),
          code: $subjectData.attr('code'),
          name: $subjectData.attr('name'),
          professor: $subjectData.attr('professor'),
          credit: Number($subjectData.attr('credit')),
          time: $subjectData.attr('time'),
          place: $subjectData.attr('place'),
          times: $.map($subjectData.find('timeplace'), function (timeplaceData) {
            var $timeplaceData = $(timeplaceData);
            return {
              day: Number($timeplaceData.attr('day')),
              starttime: Number($timeplaceData.attr('start')),
              endtime: Number($timeplaceData.attr('end')),
              place: $timeplaceData.attr('place')
            };
          })
        });
        if (_set.hasSyllabus === true) {
          var syllabusUrl = '/timetable/syllabus/' + $subjectData.attr('id');
          var $syllabusTd = $('<td></td>').appendTo($tr);
          $('<a></a>').addClass('syllabus').text('조회').attr({href: syllabusUrl, target: '_blank'}).appendTo($syllabusTd);
        }
        _.each(_set.subjectColumnInfo, function (item) {
          var value = $subjectData.attr(item.name) || "";
          var $td = $('<td></td>');
          if (item.name === 'lectureRate') {
            var $star = $('<a></a>');
            var lectureId = $subjectData.attr('lectureId');
            if (lectureId !== '0') {
              $star.attr({
                href: '/lecture/view/' + lectureId,
                target: '_blank',
                title: value
              });
            } else {
              $star.attr('href', 'javascript: alert("아직 등록된 강의평이 없습니다.");');
            }
            $star.addClass('star').appendTo($td);
            var percent = Number(value) / 5 * 100 + '%';
            $('<span></span>').addClass('on').width(percent).appendTo($star);
          } else {
            $td.html(value);
            if (item.name === 'name') {
              $td.addClass('bold');
            } else if (_.contains(['target', 'notice'], item.name) === true) {
              $td.addClass('small');
            }
          }
          $td.appendTo($tr);
        });
        $tr.appendTo($listTbody);
      });
      _set.subjectStartNum += _set.subjectLimitNum;
      _set.isSubjectRendered = true;
    },
    onListScroll: function () {
      if (_set.isSubjectRendered === false || _set.isSubjectLoadCompleted === true) {
        return;
      }
      var listScrollTop = $list.scrollTop();
      var remainingHeight = $list[0].scrollHeight - $list.height();
      if (listScrollTop < remainingHeight - 96) {
        return;
      }
      _fn.loadSubjects(false, function (data) {
        _fn.appendSubjects(data);
      });
    }
  };
  _fn.init();
});