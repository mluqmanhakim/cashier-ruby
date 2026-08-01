class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_store_owner!

  def create
    @order = current_user.orders.build
    quantities = params[:quantities] || {}

    quantities.each do |menu_item_id, quantity|
      qty = quantity.to_i
      next if qty <= 0

      menu_item = current_user.menu_items.find_by(id: menu_item_id)
      next unless menu_item

      @order.order_items.build(menu_item: menu_item, quantity: qty, price: menu_item.price)
    end

    if @order.order_items.any? && @order.save
      redirect_to order_path(@order), notice: 'Order was successfully created.'
    else
      redirect_to root_path, alert: 'No items selected or failed to create order.'
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  private

  def verify_store_owner!
    unless current_user.store_owner?
      redirect_to root_path, alert: 'Only store owners can access this page.'
    end
  end
end
