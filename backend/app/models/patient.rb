class Patient < ApplicationRecord

  mount_uploader :picture, PictureUploader

  has_many :actions, dependent: :destroy

  validates :name,       presence: true
  validates :birth_date, presence: true
  validates :code,       presence: true

  geocoded_by      :address
  after_validation :geocode

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end
end
