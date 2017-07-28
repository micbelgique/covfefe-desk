class ActionType < ApplicationRecord

  has_many :actions

  has_many :action_type_agent_links, dependent: :destroy
  has_many :agents, through: :action_type_agent_links

  validates :name, presence: true

end
