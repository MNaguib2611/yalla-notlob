class UserJoinOrdersController < ApplicationController
  def index
    @orders = Order.find(2)
    @orderItems = OrderItem.where(order_id:@orders.id)
    p @orderItems
    @user_joined_order = UserJoinOrder.where(order_id:@orders.id)
    p @user_joined_order 
  end

  def create
  end

  def destroy
  end

  def new
  end

  def show
  end
end
