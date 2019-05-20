class Manga < ApplicationRecord
  has_many :loans
  belongs_to :user
end
