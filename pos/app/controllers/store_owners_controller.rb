class StoreOwnersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_administrator!

  def index
    @store_owners = User.store_owner
  end

  def new
    @store_owner = User.new
  end

  def create
    @store_owner = User.new(store_owner_params)
    @store_owner.role = :store_owner
    if @store_owner.save
      redirect_to store_owners_path, notice: 'Store owner was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def verify_administrator!
    unless current_user.administrator?
      redirect_to root_path, alert: 'Only administrators can access this page.'
    end
  end

  def store_owner_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
