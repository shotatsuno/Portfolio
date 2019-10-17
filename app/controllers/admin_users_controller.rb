class AdminUsersController < ApplicationController
  
  def index
    @users=User.all
  end
  
  def show
    @user=User.find(params[:id])
    @decks=@user.decks
  end
  
  def destroy
    user=User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end
  
  def admin_search_user
    @user_searchs = User.search_user(params[:search])
  end
  
end
