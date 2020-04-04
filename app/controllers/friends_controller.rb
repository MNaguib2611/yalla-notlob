class FriendsController < ApplicationController
  def index
    @user=User.find(2)
    p @user
    p @user.id
    p @user.email
    @friends =  Friend.where(user_id: @user.id)
    # @friendsData=  @friends.friend_id
    @friendData=User.where(id:@friendsData)
    # User.where(id:@friends.user_id)
    # p @friendsData
    p @friends
  end

  def create
    @friend = Friend.new
    user=User.find(2)
    @friend.user_id =user.id
    @friend.friend_id = 4
    @friend.save
    p @friend
    # @user_friend = current_user.user_friends.build(:friend_id => params[:friend_id])
    if @friend.save
      flash[:notice] = "Added friend."
      redirect_to :friends
    else
      flash[:notice] = "Unable to add friend."
      redirect_to :friends
    end
  end

  def destroy
    @friend.destroy
    redirect_to :friends
    respond_to do |format|
      format.html { redirect_to friends, notice: 'unfriend was successfully done.' }
      format.json { head :no_content }
    end
  end

  def new
  end

  def show
  end
end
