


























































(function ($) {
	var _oldShow = $.fn.show;
	$.fn.show = function (speed, oldCallback) {
		return $(this).each(function () {
			var obj = $(this),
			newCallback = function () {
				if ($.isFunction(oldCallback)) {
					oldCallback.apply(obj);
				}
			};
			obj.trigger('beforeShow');
			_oldShow.apply(obj, [speed, newCallback]);
			obj.trigger('afterShow');
		});
	};
	var _oldHide = $.fn.hide;
	$.fn.hide = function (speed, oldCallback) {
		return $(this).each(function () {
			var obj = $(this),
			newCallback = function () {
				if ($.isFunction(oldCallback)) {
					oldCallback.apply(obj);
				}
			};
			obj.trigger('beforeHide');
			_oldHide.apply(obj, [speed, newCallback]);
			obj.trigger('afterHide');
		});
	};
})(jQuery);

if (!_gfn) var _gfn = {};
_gfn = _.extend(_gfn, {
	formatRelativeDate: function (text, isShort) {
		if (!text) {
			return '';
		}
		var yearString = text.slice(0, 4);
		var yearShortString = text.slice(2, 4);
		var monthString = text.slice(5, 7);
		var dayString = text.slice(8, 10);
		var timeString = text.slice(11, 16);
		var year = Number(yearString);
		var month = Number(monthString);
		var day = Number(dayString);
		var hour = Number(timeString.slice(0, 2));
		var minute = Number(timeString.slice(3, 5));
		var second = Number(timeString.slice(6, 8));
		var date;
		var now = _diffTime ? new Date(new Date().getTime() - _diffTime) : new Date();
		var target = new Date(year, month - 1, day, hour, minute, second);
		var diff = (now.getTime() - target.getTime()) / 1000;
		if (diff < 120) {
			date = '방금';
		} else if (diff < 3600) {
			date = Math.floor(diff / 60) + '분 전';
		} else if (isShort) {
			if (now.getFullYear() === target.getFullYear() && now.getMonth() === target.getMonth() && now.getDate() === target.getDate()) {
				date = timeString;
			} else {
				date = monthString + '/' + dayString;
			}
		} else {
			date = monthString + '/' + dayString + ' ' + timeString;
			if (now.getFullYear() !== target.getFullYear()) {
				date = yearShortString + '/' + date;
			}
		}
		return date;
	},
	getPageCache: function (location) {
		if (typeof Storage === 'undefined') {
			return null;
		}
		try {
			var key = 'page_' + location.pathname + location.search;
			var value = sessionStorage.getItem(key);
			var data = JSON.parse(value);
			return data;
		} catch (e) {
			return null;
		}
	},
	setPageCache: function (location, data) {
		if (typeof Storage === 'undefined') {
			return;
		}
		try {
			var key = 'page_' + location.pathname + location.search;
			var value = JSON.stringify(data);
			sessionStorage.setItem(key, value);
		} catch (e) {
		}
	},
	pushHistoryState: function (url, data) {
		if (typeof history.pushState !== 'undefined') {
			history.pushState(data, null, url);
			if (typeof gtag === 'function') {
				gtag('config', 'UA-22022140-4', {
					'page_path': url
				});
			}
		} else {
			location.href = url;
		}
	},
	replaceHistoryState: function (url, data) {
		if (typeof history.replaceState !== 'undefined') {
			history.replaceState(data, null, url);
			if (typeof gtag === 'function') {
				gtag('config', 'UA-22022140-4', {
					'page_path': url
				});
			}
		} else {
			location.href = url;
		}
	}
});

$().ready(function () {
	$('.modal').bind('beforeShow', function (event) {
		if (event.target !== this) return false;
		var $modal = $(this);
		var $modalwrap = $('<div></div>').addClass('modalwrap');
		if ($modal.hasClass('popup')) $modalwrap.addClass('lighter');
		$modalwrap.insertBefore($modal);
		$modal.css({ 'margin-left': -($modal.outerWidth() / 2), 'margin-top': -($modal.outerHeight() / 2) });
	}).bind('afterHide', function (event) {
		if (event.target !== this) return false;
		var $modal = $(this);
		$('div.modalwrap').remove();
	});
	$(document).on('click', 'div.modalwrap', function (event) {
		$('.modal:visible').hide();
	});
	$('#submenu').on('click', 'a.more', function () {
		$(this).hide();
		$('#submenu').find('div.group.hidden').css('display', 'inline-block');
	});
	$('#container').on('click', 'aside > div.title > a.hamburger', function () {
		var $nav = $('nav').eq(0);
		$nav.show();
		$('<div></div>').addClass('shadow').one('click', function () {
			$nav.hide();
			$(this).remove();
		}).appendTo($nav);
	});
	if ($('#container > aside > div.menu').height() === 40) {
		var $menu = $('#container > aside > div.menu');
		function scrollToActiveMenu() {
			if (!$menu.is(':has(li.active)')) {
				return false;
			}
			$menu.scrollLeft(0);
			var left = Math.floor($menu.find('li.active').offset().left) - 50;
			$menu.scrollLeft(left);
		}
		scrollToActiveMenu();
		$menu.bind('DOMNodeInserted', function () {
			scrollToActiveMenu();
		});
		$menu.on('click', 'ol > li', function () {
			setTimeout(function () {
				scrollToActiveMenu();
			}, 10);
		});
	}
	$('#sheet').on('click', 'a.close', function () {
		$('#sheet').remove();
	});
	if ($('#account').is(':has(a.icon.message)')) {
		$.ajax({
			url: _apiServerUrl + '/find/messageBox/unreadCount',
			xhrFields: {withCredentials: true},
			type: 'POST',
			success: function (data) {
				var count = Number($(data).find('response > count').text()) || 0;
				if (count > 0) {
					$('<span></span>').addClass('badge').text(count).appendTo($('#account').find('a.icon.message'));
				}
			}
		});
	}
	if (typeof Storage !== 'undefined') {
		var currentpageCache = sessionStorage.getItem('currentpage');
		if (currentpageCache) {
			sessionStorage.setItem('previouspage', currentpageCache);
		}
		sessionStorage.setItem('currentpage', location.pathname + location.search);
	}
	setTimeout(function () {
		$(window).on('popstate', function () {
			if (typeof gtag === 'function') {
				gtag('config', 'UA-22022140-4', {
					'page_path': location.pathname + location.search
				});
			}
		});
	}, 0);
});