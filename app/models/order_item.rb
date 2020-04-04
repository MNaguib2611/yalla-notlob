class OrderItem < ApplicationRecord
    # validates :item, :amount, :price, presence: true
    # belongs_to :user_join_order
    belongs_to :user
end
