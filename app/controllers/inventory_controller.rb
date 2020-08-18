class InventoryController < ApplicationController

  def update_by_item
    item = Item.find(params[:item_id])
    character = Character.find(params[:character_id])
    quantity = params[:quantity]

    character.sheet.inventories.create(item: item, quantity: quantity)
  end
end
