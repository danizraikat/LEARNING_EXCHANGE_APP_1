class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]  
   
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
    @note = Note.new   
    @users = User.all  
    @user = User.new
  end

  # GET /notes/1
  # GET /notes/1.json
  def show 
    @comment = Comment.new       
     
  end

  # GET /notes/new
  def new 
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = current_user.notes.new(note_params)

    note_tags = params[:note].delete(:tags)
    @note.tag_ids = note_tags    
    
    note_favorites = params[:note].delete(:favorites)
    @note.favorite_ids = note_favorites    


    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_url, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to notes_url, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:user_id, :content)
    end

end
