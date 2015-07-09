class UsersController < ApplicationController
    
  before_action :authenticate_user!


  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
    @note = Note.new 
    @notes = Note.all
    @users = User.all
    @favorite = Favorite.new
    @favorites = Favorite.all  
  end

  def upvote
    @note = Note.find(params[:id])
    @note.liked_by current_user
    redirect_to @note
  end

  def downvote
    @note = Note.find(params[:id])
    @note.disliked_by current_user
    redirect_to @note
  end

  private 
    def user_params
      params.require(:user).permit(:profile_image, :remote_profile_image_url)
    end

  #HOW TO EDIT THIS CODE SO THAT IT RELATES TO USER IMAGES?
  # private
  #   def image_params
  #     params.require(:image).permit(:name, :graffiti_image, :remote_graffiti_image_url)
  #   end
end



