class OrdersController < ApplicationController
  # include Pagy::Backend
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    if current_user

      @pagy, @orders = pagy_array(User.find(current_user.id).orders.to_a + Order.find_by_sql("SELECT order_type,restaurant,joined_num ,invited_num,status, orders.user_id, orders.id from orders, user_join_orders WHERE orders.id = user_join_orders.order_id AND user_join_orders.user_id = #{current_user.id}"),items: 2)
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    p "params values: #{params}"
    p " user id : #{current_user.id}"
    @order = Order.new
    @order.order_type = params[:order_type]
    @order.restaurant = params[:restaurant]
    @order.menu_img = params[:menu_img]
    @order.status =  "pending"
    @order.user_id = current_user.id
    @order.save()
    redirect_to action: :new
    # @order = Order.new(order_params)

    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def updateStatus
    # order = User.find(current_user.id).orders.where(id: params[:orderId]);
    # p order.update(status: params[:status])
    st = ActiveRecord::Base.connection.raw_connection.prepare("UPDATE `orders` SET `orders`.`status` = ?, `orders`.`updated_at` = ? WHERE `orders`.`id` = ?")
    st.execute(params[:status]  , DateTime.now, params[:orderId])
    st.close
    redirect_to orders_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {})
    end
end
