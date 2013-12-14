class FriendshipsController < ApplicationController

  def new
    if target = User.find(params[:target_id])
      @friendship = Friendship.new
      @friendship.target = target
    end
  end

  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.sender_id = current_user.id
    if @friendship.save 
      redirect_to users_path
    else
      render 'new'  
    end
  end

  def edit
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true
    if @friendship.save 
      redirect_to users_path
    else
      render 'index'  
    end
  end

  private
  def friendship_params
    params.require(:friendship).permit(:target_id, :id)
  end
  
end