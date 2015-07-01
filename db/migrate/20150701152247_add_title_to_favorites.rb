class AddTitleToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :title, :string
  end
end
