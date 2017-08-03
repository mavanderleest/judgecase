;(function () {
  // Reflect scrolling in navigation
  var navActive = function(section) {
    var el = $('nav > ul');
    el.find('li').removeClass('active');
    el.each(function(){
      $(this).find('a[data-nav-section="'+section+'"]').closest('li').addClass('active');
    });
  };
  var navigationSection = function() {

    var $section = $('div[data-section]');

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
        offset: function() { return -$(this.element).height() + 155; }
    });

  };

  // Document on load.
  $(function(){

    navigationSection();

  });

}());