class StaticPagesController < ApplicationController
  
  before_action :authenticate_user!

  def home
    @user = User.find(params[:id]) 
    @users = User.all
  end

  def about
  end

  private 
    def user_params
      params.require(:user).permit(:profile_image, :remote_profile_image_url)
    end
    
end
