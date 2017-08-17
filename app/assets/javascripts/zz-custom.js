;(function() {
    'use strict';
    var isiPad = function() {
        return (navigator.platform.indexOf("iPad") != -1);
    };
    var isiPhone = function() {
        return ((navigator.platform.indexOf("iPhone") != -1) || (navigator.platform.indexOf("iPod") != -1));
    };
    $(window).on('load', function(){
        // Remove the # from the hash, as different browsers may or may not include it
        var hash = location.hash.replace('#','');
        if(hash != ''){
            // Clear the hash in the URL
            location.hash = '';   // delete front "//" if you want to change the address bar
            location.href.replace('#',"");
            $('html, body').animate({
                scrollTop: $('[data-section="' + hash + '"]').offset().top - 55
            }, 500);
        }
    });
    var clickMenu = function() {
        $('#js-navigation-menu a:not(.external)').click(function(event) {
            var section = $(this).data('nav-section'),
                navbar = $('#js-navigation-menu'),
                url = $(this).href;
            if ($('[data-section="' + section + '"]').length) {
                $('html, body').animate({
                    scrollTop: $('[data-section="' + section + '"]').offset().top - 55
                }, 500);
            }
            else {
                window.location.replace(url);
            }
            // if (navbar.is(':visible')) {
            //   navbar.removeClass('in');
            //   navbar.attr('aria-expanded', 'false');
            //   $('.js-fh5co-nav-toggle').removeClass('active');
            // }
            event.preventDefault();
            return false;
        });
    };
    var navActive = function(section) {
        var $el = $('#js-navigation-menu');
        $el.find('li').removeClass('active');
        $el.each(function() {
            $(this).find('a[data-nav-section="' + section + '"]').closest('li').addClass('active');
        });
    };
    var navigationSection = function() {
        var $section = $('section[data-section]');
        $section.waypoint(function(direction) {
            if (direction === 'down') {
                navActive($(this.element).data('section'));
            }
        }, {
            offset: '150px'
        });
        $section.waypoint(function(direction) {
            if (direction === 'up') {
                navActive($(this.element).data('section'));
            }
        }, {
            offset: function() {
                return -$(this.element).height() + 155;
            }
        });
    };
    var windowScroll = function() {
        var lastScrollTop = 0;
        $(window).scroll(function(event) {
            var header = $('header'),
                scrlTop = $(this).scrollTop();
            if (scrlTop > 500 && scrlTop <= 2000) {
                header.addClass('navbar-fixed-top custom-animated slideInDown');
            } else if (scrlTop <= 500) {
                if (header.hasClass('navbar-fixed-top')) {
                    header.addClass('navbar-fixed-top custom-animated slideOutUp');
                    setTimeout(function() {
                        header.removeClass('navbar-fixed-top custom-animated slideInDown slideOutUp');
                    }, 100);
                }
            }
        });
    };
    var callButtonScroll = function() {
        var lastScrollTop = 0;
        $(window).scroll(function(event) {
            var callButton = $('#callButton'),
                scrlTop = $(this).scrollTop();
            if (scrlTop > 500 && scrlTop <= 2000) {
                callButton.addClass('call-fixed-bottom custom-animated slideInUp');
            } else if (scrlTop <= 500) {
                if (callButton.hasClass('call-fixed-bottom')) {
                    callButton.addClass('call-fixed-bottom custom-animated slideOutDown');
                    setTimeout(function() {
                        callButton.removeClass('call-fixed-bottom custom-animated slideInUp slideOutDown');
                    }, 100);
                }
            }
        });
    };
    $(function() {
        clickMenu();
        navActive();
        windowScroll();
        navigationSection();
        callButtonScroll();
    });
}());