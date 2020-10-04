var master = master || {};

master = (function () {

  function fillCharacterLifeBar() {
    $('.progress-life-value').on('keyup change', function (event) {
      var sheet_id = $(this).data('sheet-id'),
          updated_life = $(this).val(),
          total_life_points = $(".total-life-value[data_sheet_id="+sheet_id+"]").text(),
          width_value = 0;


      if ($(".life-bar[data_sheet_id="+sheet_id+"]").length != 0 ) {
         width_value = (100 * updated_life) / total_life_points
         $(".life-bar[data_sheet_id="+sheet_id+"]").width(width_value + "%")
      }
    });
  }

  function defineCharacterLifeBarValue(){
    // progress-life-value
  }


  function init() {
    fillCharacterLifeBar();
  }

  return {
    init: init
  };
}());

$(document).ready(function () {
  master.init();
});


$(document).ready(function () {

});
