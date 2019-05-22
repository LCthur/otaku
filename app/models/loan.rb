class Loan < ApplicationRecord
  belongs_to :manga
  belongs_to :user
  validates  :started_at, presence: true
end
