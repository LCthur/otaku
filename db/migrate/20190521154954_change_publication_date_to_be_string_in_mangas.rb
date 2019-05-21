class ChangePublicationDateToBeStringInMangas < ActiveRecord::Migration[5.2]
  def change
    change_column :mangas, :publication_date, :string
  end
end
