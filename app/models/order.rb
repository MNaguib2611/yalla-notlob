class Order < ApplicationRecord
    validates :order_type, :restaurant, :menu_img, presence: true
    belongs_to :user
    enum order_type: { breakfast: 'breakfast', dinner: 'dinner', lunch:'lunch' }
    enum status: { waiting: 'waiting', finished: 'finished', cancelled:'cancelled' }
end
