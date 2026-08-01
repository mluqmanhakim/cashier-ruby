class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.store_owner?
      @menu_items = current_user.menu_items
      @order = Order.new
    end
  end
end
