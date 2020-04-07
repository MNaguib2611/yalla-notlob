class UserJoinOrdersController < ApplicationController
  before_action :auth

  def auth
    if ! current_user
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end
  
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
	@users_joined=OrderItem.where(order_id: user_order_id, user_id: User.select("id").where("id = ?", @user_joined_order.user_id))
      if !@users_joined.empty?
         @users_joined.destroy_all
      end
      p @users_joined
      flash[:notice] = "User was successfully destroyed."
      redirect_to :controller => "user_join_orders", :action => "index", :order_id => user_order_id
    end


  end

  def new
  end

  def show
   
  end
end
