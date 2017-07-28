class Patient < ApplicationRecord

  mount_uploader :picture, PictureUploader

  validates :name,       presence: true
  validates :birth_date, presence: true
  validates :code,       presence: true

end
