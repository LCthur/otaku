class Loan < ApplicationRecord
  belongs_to :manga
  belongs_to :user
  validates  :started_at, presence: true
  validates  :user_id, presence: true
end
