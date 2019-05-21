class AddLoanDurationToMangas < ActiveRecord::Migration[5.2]
  def change
    add_column :mangas, :loan_duration, :integer
  end
end
