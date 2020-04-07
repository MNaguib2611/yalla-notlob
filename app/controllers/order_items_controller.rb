class OrderItemsController < ApplicationController
  
  before_action :auth

  def auth
    if ! current_user
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end
  
  def index
  # if current_user
  # @orders = User.find(current_user.id).orders
  # @orders = User.find(2).orders
    # p @orders.ids#arrray but should n't be like that order id comoe from orders page
    @orders = Order.find(params[:order_id])
    @orderItems = OrderItem.where(order_id:@orders.id)
    p @orderItems
    @users_joined_order = UserJoinOrder.where(order_id:@orders.id)
    @num_joined=@users_joined_order.count 
    @users_invited_to_order = UserInvitedToOrder.where(order_id:@orders.id)
    @num_invited=@users_invited_to_order.count 

  # else
    # redirect_to new_user_session_path, notice: 'You are not logged in.'
  # end
    

  end

  def create
    p "params values: #{params}"
    # p " user id : #{current_user.id}"
    # order = User.find(2).orders
    # p order

    @orderItem = OrderItem.new
    @orderItem.item = params[:item]
    @orderItem.amount = params[:amount]
    @orderItem.price = params[:price]
    @orderItem.comment = params[:comment]
    # @orderItem.user_id = current_user.id
    @user = User.where("name = ?", params[:person]).ids.first;
    p @user
    @orderItem.user_id =@user;
    @orderItem.order_id =  params[:order_id]
    @orderItem.save()
    if  @orderItem.save()
      flash[:notice] = "Item was successfully Added."
    else
      flash[:notice] = "unable to add this Item ."
    
    end
    redirect_to controller: 'order_items', action: 'index', order_id: params[:order_id]

  end

  def destroy
    p "params values: #{params}"

    @orderItem = OrderItem.find(params[:id])
    @order_id = @orderItem.order_id
    @orderItem.destroy
    p "***********************************"
    p "params values: #{params}"
    p "***********************************"
    if  @orderItem.destroy
      flash[:notice] = "Item was successfully destroyed."
    end
    redirect_to controller: 'order_items', action: 'index', order_id: @order_id

    # respond_to do |format|
    #   format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  def new
    @orderItem = OrderItem.new

  end

  def show
    @orders = Order.find(params[:order_id])
    @users_joined_order = UserJoinOrder.where(order_id:@orders.id)
    @users_joined=@users_joined_order.ids 
    @users_joined.each do |user|
      @userData = User.where("id = ?", user);
      p @userData
    end
  end

end
