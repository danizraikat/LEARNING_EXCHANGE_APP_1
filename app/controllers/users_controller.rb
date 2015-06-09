class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
  end

  #HOW TO EDIT THIS CODE SO THAT IT RELATES TO USER IMAGES?
  # private
  #   def image_params
  #     params.require(:image).permit(:name, :graffiti_image, :remote_graffiti_image_url)
  #   end
end



