class FriendsController < ApplicationController
  def index
    @user=current_user

    # p @user.friends.length   ##rows in friends where current_user.id is friend_id
    # p @user.friends_data.length       ##rows in friends where current_user.id is user_id



    ##users that current user can add (all users except [current users,users that current_user adde ,and users who added current user])
    @users=User.all.where.not(id:current_user.id).where.not(id:@user.friends.pluck(:user_id)).where.not(id:@user.friends_data.pluck(:friend_id)) 
    
   
    # @friendsAll=User.all.where(id:@user.friends.pluck(:user_id)).where(id:@user.friends_data.pluck(:user_id))
    @friendsAll=User.all.where(id:[@user.friends.pluck(:user_id)]).or(User.all.where(id:[@user.friends_data.pluck(:friend_id)]))
    p"here"
    p @friendsAll.length
  end

  def create
    p "here I am"
    friendFromUsersTable=User.all.where(email:params["email"]).first()
    @friend = Friend.new
    @friend.user_id =current_user.id
    @friend.friend_id = friendFromUsersTable.id
    @friend.save
    p @friend
    if @friend.save
      flash[:notice] = "Added friend."
      redirect_to :friends
    else
      flash[:notice] = "Unable to add friend."
      redirect_to :friends
    end
  end

  def destroy
   
    Friend.where(friend_id:params["friend_id"]).where(user_id:current_user.id ).destroy_all
    Friend.where(friend_id:current_user.id).where(user_id:params["friend_id"] ).destroy_all

    redirect_to :friends
    # respond_to do |format|
    #   format.html { redirect_to friends, notice: 'unfriend was successfully done.' }
    #   format.json { head :no_content }
    # end
  end

  def new
  end

  def show
  end
end
