class AgentType < ApplicationRecord

  has_many :agents, dependent: :destroy

  validates :name, presence: true

end
