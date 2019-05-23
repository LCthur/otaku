class AddLoanStateToMangas < ActiveRecord::Migration[5.2]
  def change
    add_column :mangas, :loan_state, :boolean
  end
end
