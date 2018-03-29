class AddDaysToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :days, :integer
  end
end
