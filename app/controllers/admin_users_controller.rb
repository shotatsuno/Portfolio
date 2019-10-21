class AdminUsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @users=User.page(params[:page]).per(30)
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
