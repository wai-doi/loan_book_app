class Loan < ApplicationRecord
  validates :name, presence: true
  validates :book, presence: true
end
