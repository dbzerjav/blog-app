class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
    @user = current_user
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new

  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friend = User.find(params[:friend_id])
      @friendship = current_user.friendships.build( user_id: current_user.id, friend_id: params[:friend_id], friend_name: @friend.username, user_name: current_user.username, approved: "false")
      if @friendship.save
        flash[:notice] = "Friend request sent."
        redirect_to :back
      else
        flash[:danger] = "Unable to request friendship."
        redirect_to :back
      end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(approved: true)
      if @friendship.save
        flash[:notice] = "Successfully confirmed friend!"
        redirect_to root_url
      else
        flash[:danger] = "Sorry! Could not confirm friend!"
        redirect_to root_url
      end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    flash[:notice] = "Friendship successfully removed."
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :approved, :friend_name, :user_name)
    end
end
