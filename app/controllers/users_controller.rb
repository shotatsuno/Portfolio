class UsersController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  
  def index
    @users = User.all
  end
  
  def edit
    @user = current_user
    @profile_image = User.new
    @new_profile = User.new
    @decks = @user.decks.all
  end
  
  def show
    @user=User.find(params[:id])
    @decks=@user.decks.all
  end
  
  
  def edit_introduction
    new_profile = User.find(params[:id])
    
   if new_profile.update(profile_params)
      redirect_to edit_user_path(current_user.id)
   end
  end
  
  def edit_profile_image
    user= User.find(params[:id])
    
    if user.update(image_params)
       redirect_to edit_user_path(current_user.id)
    else
       redirect_to edit_user_path(current_user.id)
    end
  end
  
  def search_user
    @search_users = User.search_user(params[:search])
  end
  
  private
    
    def profile_params
      params.require(:user).permit(:introduction)
    end
  
    def image_params
      params.require(:user).permit(:profile_image, :remove_profile_image)
    end
  
end
