class Manga < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :loans
  belongs_to :user
end