class AdminInquiriesController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @inquiries=Inquiry.order('created_at DESC').page(params[:page]).per(50)
    @users=User.all
  end
  
  def destroy
    @inquiry=Inquiry.find(params[:id])
    @inquiry.destroy
    redirect_to admin_inquiries_path
  end
  
  def show
    @inquiry=Inquiry.find(params[:id])
    @user=@inquiry.user
    @inquiry.look_status=1
    @inquiry.save
  end
  
 
  
end
