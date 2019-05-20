class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :description
      t.string :author
      t.string :editor
      t.date :publication_date
      t.string :serie_name
      t.integer :tome_number
      t.string :genre
      t.integer :pages_number
      t.string :language
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
