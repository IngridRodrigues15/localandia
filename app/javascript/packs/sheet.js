
export function fillLifeBar(sheet_id, updated_life) {
  var life_points = $("#sheet_life_value[data_sheet_id="+sheet_id+"]").text(),
      total_life_points = parseInt(life_points),
      width_value = 0;

  if ($(".life-bar[data_sheet_id="+sheet_id+"]").length != 0 ) {
    width_value = (100 * updated_life) / total_life_points
    $(".life-bar[data_sheet_id="+sheet_id+"]").width(width_value + "%")
  }
}

var sheet = sheet || {};

  sheet = (function () {

  function fillInitialLifeBar() {
    if ($("#life-bar").length == 0 ) {
      return;
    }

    let actual_life_points = $("#life-bar").attr("aria-valuenow"),
        life_points = $("#sheet_life_value").text(),
        total_life_points = parseInt(life_points),
        width_value = 0;

    width_value = (100 * actual_life_points) / total_life_points
    $("#life-bar").width(width_value + "%")
  }

  function init() {
    fillInitialLifeBar();
  }

  return {
    init: init,
  };
}());

$(document).ready(function () {
  sheet.init();
});
