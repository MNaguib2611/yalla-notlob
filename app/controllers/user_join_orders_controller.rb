class UserJoinOrdersController < ApplicationController
  def index
    @orders = Order.find(params[:order_id])
    @user_joined_order = UserJoinOrder.where(order_id:@orders.id)
    p @user_joined_order
  end

  def create
  end

  def destroy
    p "params values: #{params}"

    @user_joined_order = UserJoinOrder.find(params[:id])
    user_order_id=@user_joined_order.order_id
    @user_joined_order.destroy
    if @user_joined_order.destroy
      flash[:notice] = "User was successfully destroyed."
      redirect_to :controller => "user_join_orders", :action => "index", :order_id => user_order_id
    end


  end

  def new
  end

  def show
   
  end
end
