class Agent < ApplicationRecord

  belongs_to :type, class_name: 'AgentType'

  has_many :action_type_agent_links, dependent: :destroy
  has_many :action_types, through: :action_type_agent_links

  validates :name, presence: true
  validates :type, presence: true

end

