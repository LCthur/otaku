class Manga < ApplicationRecord
  has_many :loans
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end