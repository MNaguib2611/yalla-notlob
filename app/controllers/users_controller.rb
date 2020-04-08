class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
  #  p(current_user);
    if user_signed_in? 
      p "working"
      ## User's Orders
    @orders = User.find(current_user.id).orders.where(status: 'waiting').to_a
    
    ## Joined Orders
    @joined_orders_records = UserInvitedToOrder.all.where(guest_id: current_user.id, status: 'accepted').select('order_id').to_a
    @joined_orders_ids = [];
    @friends_host_ids = [];
    @joined_orders_records.each do |order|
      @joined_orders_ids.push(order.order_id)
    end
    
    @joined_orders = Order.where(id: @joined_orders_ids, status: 'waiting').to_a
    
    @joined_orders.each do |order|
      @friends_host_ids.push(order.user_id)
    end

    @friends_data = User.find(@friends_host_ids)
    @friends_orders = []
    @i = 0
    @joined_orders.each do |order|
      @friends_orders.push(host_id: @friends_data[@i].id, name: @friends_data[@i].name, order: order)
      @i += 1
    end

    ## Friends Orders
    # @user_friends = User.find(current_user.id).friends_data
    # @friend_ids = []
    # @user_friends.each do |friend|
    #   @friend_ids.push(friend.friend_id)
    # end
    # @friends_data = User.find(@friend_ids)
    # @friends_orders = []
    # @friends_data.each do |friend|
    #   @friends_orders.push(id: friend.id, name: friend.name, orders: friend.orders.to_a)
    # end
    
    # @info = [user_orders: @orders, friends_data: @friends_data, joined_orders: @joined_orders]
    @info = [user_orders: @orders, joined_orders: @friends_orders]
    else 
      redirect_to new_user_registration_path, notice: "Please Login to view that page!"
    end 
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    p "-----------------------"
    p params[:id]
    p "-----------------------"
    @user = User.find(params[:id]);
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end
