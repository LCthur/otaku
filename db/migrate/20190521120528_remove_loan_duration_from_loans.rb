class RemoveLoanDurationFromLoans < ActiveRecord::Migration[5.2]
  def change
    remove_column :loans, :loan_duration, :integer
  end
end
