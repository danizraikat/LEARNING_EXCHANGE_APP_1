class FavoriteNotesController < ApplicationController
  before_action :set_note    

  def index
    @notes = current_user.favorite_notes
    @users = User.all  
    @user = User.new  
    
  end

  def create
    if Favorite.create(favorited: @note, user: current_user)
      redirect_to favorite_notes_path, notice: 'Project has been favorited'
    else
      redirect_to @note, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @note.id, user_id: current_user.id).first.destroy
    redirect_to @note, notice: 'Project is no longer in favorites'
  end
  
  private
  
  def set_note
    @note = Note.find(params[:note_id] || params[:id])
  end

  def note_params
    params.require(:note).permit(:user_id, :content)
  end
end
