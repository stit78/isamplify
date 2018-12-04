(function() {
  var $point_arr, $points, $progress, $trigger, active, max, tracker, val;

  $trigger   = $('.trigger').first();
  $points    = $('.progress-points').first();
  $point_arr = $('.progress-point');
  $progress  = $('.progress').first();

  val     = +$points.data('current') - 1;
  max     = $point_arr.length - 1;
  tracker = active = 0;

  function activate(index) {
    if (index !== active) {
      active       = index;
      var $_active = $point_arr.eq(active)

      $point_arr
        .removeClass('completed active')
        .slice(0, active).addClass('completed')

      $_active.addClass('active');

      return $progress.css('width', (index / max * 100) + "%");
    }
  };

  $points.on('click', 'li', function(event) {
    var _index;
    _index  = $point_arr.index(this);
    tracker = _index === 0 ? 1 : _index === val ? 0 : tracker;

    return activate(_index);
  });

  $trigger.on('click', function() {
    return activate(tracker++ % 2 === 0 ? 0 : val);
  });

  setTimeout((function() {
    return activate(val);
  }), 1000);

}).call(this);

