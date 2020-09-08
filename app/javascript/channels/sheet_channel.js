import consumer from "./consumer"

consumer.subscriptions.create("SheetChannel", {
  connected() {
     console.log("Sheet Connected!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
   $("#sheet_rubies_value[data_sheet_id="+data["sheet_id"]+"]").text(data["rubies"])
   $("#sheet_heroic_points_value[data_sheet_id="+data["sheet_id"]+"]").text(data["heroic_points"])
   $("#sheet_updated_life_value[data_sheet_id="+data["sheet_id"]+"]").text(data["updated_life"])
   $("#sheet_updated_mana_value[data_sheet_id="+data["sheet_id"]+"]").text(data["updated_mana"])
  }
});
