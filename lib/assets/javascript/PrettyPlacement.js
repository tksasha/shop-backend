(function($) {
  $.fn.PrettyPlacement = function(options) {
    options = $.extend({
      item: '.pp-list-item',
      spacing: 10,
      columns: 6,
    }, options);

    var width = ((this).width() - options['spacing'] * (options['columns'] - 1)) / options['columns'];

    $(options['item']).css({
      width: width,
      height: width,
      'margin-right': options['spacing'],
      'margin-bottom': options['spacing'],
    }).each(function(idx, item) {
      if((idx + 1) % options['columns'] == 0) {
        $(item).css('margin-right', 0);
      }
    }).children('img').css({
      width: width,
      height: width
    });

    return this;
  };

}(jQuery));