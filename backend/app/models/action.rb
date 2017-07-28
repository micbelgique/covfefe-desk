class Action < ApplicationRecord

  belongs_to :type, class_name: 'ActionType'
  belongs_to :agent
  belongs_to :patient

  validates :type,    presence: true
  validates :agent,   presence: true
  validates :patient, presence: true

end
