class Manga < ApplicationRecord
  has_many :loan
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :serie_name, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :editor, presence: true
  validates :description, presence: true
  validates :publication_date, presence: true
  validates :tome_number, presence: true
  validates :genre, presence: true
  validates :pages_number, presence: true
  validates :language, presence: true
  validates :photo, presence: true

  def actually_loaned?
    return loan_state
  end
end
