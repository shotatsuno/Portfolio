class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users=current_user.followings
  end
  
  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      @user.follower_num+=1
      @user.save
      flash[:success] = 'ユーザーをフォローしました'
      render :follow
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      @user.follower_num-=1
      @user.save
      render :follow
    end
  end
  
   def destroy
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    if following
      flash[:success] = 'ユーザーのフォローを解除しました'
      render :follow
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      render :follow
    end
  end
  
  def search_following
    @following_searchs = current_user.search_following(params[:search])
#    binding.pry
  end
  

end
