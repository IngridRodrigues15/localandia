class InventoryController < ApplicationController

  def update_by_item
    item = Item.find(params[:item_id])
    character = Character.find(params[:character_id])
    quantity = params[:quantity].to_i
    sheet = character.sheet
    inventory_item = sheet.inventories.create_or_update(item_id: item.id, quantity: quantity)
    sheet.deduct_rubies(quantity, item.price)

    ActionCable.server.broadcast 'inventory_channel',
      rubies: sheet.rubies,
      last_item: sheet.inventories.find_by(item_id: item.id),
      item_details: item
     head :ok
  end
end
