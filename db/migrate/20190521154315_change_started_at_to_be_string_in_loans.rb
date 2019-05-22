class ChangeStartedAtToBeStringInLoans < ActiveRecord::Migration[5.2]
  def change
    change_column :loans, :started_at, :string
  end
end
