class ActionTypeAgentLink < ApplicationRecord

  belongs_to :action_type
  belongs_to :agent

end
