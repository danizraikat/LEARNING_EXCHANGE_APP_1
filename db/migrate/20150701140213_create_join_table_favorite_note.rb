class CreateJoinTableFavoriteNote < ActiveRecord::Migration
  def change
    create_join_table :favorites, :notes do |t|
      # t.index [:favorite_id, :note_id]
      # t.index [:note_id, :favorite_id]
    end
  end
end
