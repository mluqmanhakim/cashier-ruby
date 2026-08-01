class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_store_owner!

  def index
    @menu_items = current_user.menu_items
  end

  def new
    @menu_item = current_user.menu_items.build
  end

  def create
    @menu_item = current_user.menu_items.build(menu_item_params)
    if @menu_item.save
      redirect_to menu_items_path, notice: 'Menu item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def verify_store_owner!
    unless current_user.store_owner?
      redirect_to root_path, alert: 'Only store owners can access this page.'
    end
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :price)
  end
end
