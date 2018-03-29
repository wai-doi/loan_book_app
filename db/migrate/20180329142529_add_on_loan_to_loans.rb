class AddOnLoanToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :on_loan, :boolean
  end
end
