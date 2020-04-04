class UserInvitedToOrdersController < ApplicationController
  def index
    @orders = Order.find(2)
    @user_invited_to_order = UserInvitedToOrder.where(order_id:@orders.id)
    p @user_invited_to_order
  end

 

  def destroy
    p "params values: #{params}"

    @user_invited_to_order = UserInvitedToOrder.find(params[:id])
    @user_invited_to_order.destroy
    redirect_to :order_items

  end
end
