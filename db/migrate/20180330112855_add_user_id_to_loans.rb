class AddUserIdToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :user_id, :integer
  end
end
