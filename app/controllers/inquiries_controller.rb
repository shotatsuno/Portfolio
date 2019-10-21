class InquiriesController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @user=current_user.id
    @inquiry=Inquiry.new
  end
  
  def create
    inquiry=current_user.inquiries.new(inquiry_params)
    if inquiry.save
      redirect_to new_inquiry_path, notice: "ありがとうございます。送信完了しました"
    end
  end
  

  
  private
  def inquiry_params
    params.require(:inquiry).permit(:inquiry)
  end
  
end
