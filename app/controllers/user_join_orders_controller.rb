class UserJoinOrdersController < ApplicationController
  def index
    @orders = Order.find(2)
    @user_joined_order = UserJoinOrder.where(order_id:@orders.id)
    p @user_joined_order
  end

  def create
  end

  def destroy
    p "params values: #{params}"

    @user_joined_order = UserJoinOrder.find(params[:id])
    @user_joined_order.destroy
    redirect_to :order_items

  end

  def new
  end

  def show
   
  end
end
