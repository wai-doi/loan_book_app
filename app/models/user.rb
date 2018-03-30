class User < ApplicationRecord
  has_many :loans, dependent: :destroy
  validates :name, presence: true
end
