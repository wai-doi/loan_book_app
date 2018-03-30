class Loan < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :book, presence: true
end
