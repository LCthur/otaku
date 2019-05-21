class AddPhotoToMangas < ActiveRecord::Migration[5.2]
  def change
    add_column :mangas, :photo, :string
  end
end
