class CreateActionTypeAgentLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :action_type_agent_links do |t|
      t.references :action_type, foreign_key: true
      t.references :agent,       foreign_key: true

      t.timestamps
    end
  end
end
