class UsersController < ApplicationController

  def index
  end
  
  def edit
    @user = current_user
    @profile_image = User.new
    @new_profile = User.new
    @decks = @user.decks.all
  end
  
  def edit_introduction
    new_profile = User.find(params[:id])
    
   if new_profile.update(profile_params)
      redirect_to edit_user_path(current_user.id)
   end
  end
  
  def edit_profile_image
    profile_image = User.find(params[:id])
    
    if profile_image.update(image_params)
       redirect_to edit_user_path(current_user.id)
    end
  end
  
  private
    
    def profile_params
      params.require(:user).permit(:introduction)
    end
  
    def image_params
      params.require(:user).permit(:image)
    end
  
end
