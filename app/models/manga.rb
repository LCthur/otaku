class Manga < ApplicationRecord
  LOAN_DURATION = [7, 14, 21, 28, 35, 42, 49]
  has_many :loan
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :serie_name, presence: true
  validates :title, presence: true
  validates :loan_duration, presence: true, inclusion: { in: LOAN_DURATION }
  validates :photo, presence: true

  def actually_loaned?
    return loan_state
  end
end
