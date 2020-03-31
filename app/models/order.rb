class Order < ApplicationRecord
    validates :order_type, :restaurant, :menu_img, presence: true
    belongs_to :user
end
