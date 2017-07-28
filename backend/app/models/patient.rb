class Patient < ApplicationRecord

  validates :name,       presence: true
  validates :birth_date, presence: true
  validates :code,       presence: true

end
