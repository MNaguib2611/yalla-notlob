class UserFriendsController < ApplicationController
  before_action :set_user_friend, only: [:show, :edit, :update, :destroy]

  # GET /user_friends
  # GET /user_friends.json
  def index
    @user_friends = UserFriend.all
  end

  # GET /user_friends/1
  # GET /user_friends/1.json
  def show
  end

  # GET /user_friends/new
  def new
    @user_friend = UserFriend.new
  end

  # GET /user_friends/1/edit
  def edit
  end

  # POST /user_friends
  # POST /user_friends.json
  def create
    @user_friend = UserFriend.new(user_friend_params)

    respond_to do |format|
      if @user_friend.save
        format.html { redirect_to @user_friend, notice: 'User friend was successfully created.' }
        format.json { render :show, status: :created, location: @user_friend }
      else
        format.html { render :new }
        format.json { render json: @user_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_friends/1
  # PATCH/PUT /user_friends/1.json
  def update
    respond_to do |format|
      if @user_friend.update(user_friend_params)
        format.html { redirect_to @user_friend, notice: 'User friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_friend }
      else
        format.html { render :edit }
        format.json { render json: @user_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_friends/1
  # DELETE /user_friends/1.json
  def destroy
    @user_friend.destroy
    respond_to do |format|
      format.html { redirect_to user_friends_url, notice: 'User friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_friend
      @user_friend = UserFriend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_friend_params
      params.require(:user_friend).permit(:email)
    end
end
