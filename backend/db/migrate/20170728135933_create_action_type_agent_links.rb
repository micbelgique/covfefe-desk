class CreateActionTypeAgentLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :action_type_agent_links do |t|
      t.references :action_type
      t.references :agent

      t.timestamps
    end
  end
end
