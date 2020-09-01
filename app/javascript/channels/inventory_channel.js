import consumer from "./consumer"

consumer.subscriptions.create("InventoryChannel", {
  connected() {
    console.log("Inventory Connected!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    console.log(data["rubies"]);

    var sheet = data["sheet_id"],
        rubies = data["rubies"],
        item_id = data["last_item"]["item_id"],
        item_quantity = data["last_item"]["quantity"],
        item_name = data["item_details"]["name"],
        item_description = data["item_details"]["description"];


    console.log(item_id);
    console.log(item_quantity);
    console.log(item_name);
    console.log(item_description);


    // Atualiza os rubies na tela do mestre
    $("input[data-sheet-id="+sheet+"]").attr('value', rubies);
    $("input[data-sheet-id="+sheet+"]").val(rubies);
    //Adiciona o item na ficha na tela do mestre
    if ( $("tbody[data-sheet-id="+sheet+"] tr[data-id="+item_id+"]").length ) {
      $("tbody[data-sheet-id="+sheet+"] tr[data-id="+item_id+"] td:last-child").html(item_quantity)

    } else {
      $("tbody[data-sheet-id="+sheet+"]").append('<tr data-id='+item_id+'><td>'+item_name+'</td><td>'+item_description+'</td><td>'+item_quantity+'</td></tr>');

    }


  }
});
