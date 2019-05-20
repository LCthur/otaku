class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.date :started_at
      t.integer :loan_duration
      t.references :manga, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
