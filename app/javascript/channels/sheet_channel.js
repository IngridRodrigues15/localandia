import consumer from "./consumer"
import { fillLifeBar } from '../packs/sheet.js';
import { fillManaBar } from '../packs/sheet.js';

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

   fillLifeBar(data["sheet_id"], data["updated_life"])
   fillManaBar(data["sheet_id"], data["updated_mana"])
  }
});
