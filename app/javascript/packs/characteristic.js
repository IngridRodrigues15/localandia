var characteristic = characteristic || {};

characteristic = (function () {

  function fillCharacteristicBar() {
     $('.characteristic-input').on('keyup click', function(e) {
       var actual_value = parseInt(this.value),
            width = parseInt(this.value) * 11;

        if (parseInt(this.value) == 9) {
          width = 100
        }
        this.parentElement.firstElementChild.firstElementChild.style.width = width + "%"
     });
  }

  function fillRemainingPoints() {
    $('.characteristic-input').on('keyup click', function(e) {
      var used_points = 0,
          total_points = 20;
      $('.characteristic-input').each(function(i, obj) {
          used_points += parseInt(obj.value);
      });

      var remaining_points = total_points - used_points;
      if (isNaN(remaining_points)) {
        remaining_points = 0
      }
      $(".total-points-number").text(parseInt(remaining_points));

      if (used_points != total_points) {
         $("input[type='submit']").prop('disabled', true);
      } else {
        $("input[type='submit']").prop('disabled', false);
      }
    });
  }

  function init() {
    fillCharacteristicBar();
    fillRemainingPoints();
  }

  return {
    init: init
  };
}());

$(document).ready(function () {
  characteristic.init();
});
