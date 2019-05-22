class ChangeDescriptionToBeTextInMangas < ActiveRecord::Migration[5.2]
  def change
    change_column :mangas, :description, :text
  end
end
