class AdminUsersController < ApplicationController
  
  def index
    @users=User.all
  end
  
  def show
  end
  
  def destroy
  end
  
  def admin_search_user
    @user_searchs = User.search_user(params[:search])
  end
  
end
