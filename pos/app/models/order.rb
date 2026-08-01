class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  before_save :calculate_total

  private

  def calculate_total
    self.total = order_items.sum { |item| item.price.to_d * item.quantity.to_i }
  end
end
