class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  enum role: { administrator: 0, store_owner: 1 }

  has_many :menu_items
  has_many :orders
end
