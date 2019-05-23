class AddDefaultValueToLoanState < ActiveRecord::Migration[5.2]
  def change
    change_column :mangas, :loan_state, :boolean, default: false
  end
end
