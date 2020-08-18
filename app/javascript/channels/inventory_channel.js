import consumer from "./consumer"

consumer.subscriptions.create("InventoryChannel", {
  connected() {
    console.log("Inventory Connected!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
  }
});
