class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    if current_user
      @groups = User.find(current_user.id).groups + Group.find_by_sql("SELECT groups.name as name, groups.id as id  from groups, users where users.id = groups.user_id and #{current_user.id} = groups.user_id")
      p @groups
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @groupErrors = []
    @group = Group.new
    @group.name = params[:name]
    @group.user_id = current_user.id
    respond_to do |format|
      if @group.save
        format.js
        @groups = User.find(current_user.id).groups
      else
        format.js
        @group.errors.each do |key, value|
          @groupErrors.push("#{key} #{value}")
        end
      end
    end
=begin
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end

  end

  def addFriendToGroup
    respond_to do |format|
      @users = User.find(current_user.id).users.where(email: params[:email])
      if @users.size == 0
        format.js
        @error = "Can not add this user in group"

      else
        @users_not_exist = Group.find(params[:group_id]).users.where.not(email: params[:email])
        if @users_not_exist.size != 0 || Group.find(params[:group_id]).user_id == @users[0].id
          format.js
          @error = "this user already exist in group"
        else
          p @users
          Group.find(params[:group_id]).users << @users
          format.js
        end
        @users = Group.find(params[:group_id]).users
        @group = Group.find(params[:group_id])
      end
    end
  end

  def groupDetails
    respond_to do |format|
      format.js
      @group = Group.find(params[:group_id])
      @users = @group.users.where.not(id: current_user.id)
    end
  end

  def removeFriendFromGroup
    Group.find(params[:group_id]).users.delete(User.find(params[:user_id]))
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.fetch(:group, {})
  end
end
