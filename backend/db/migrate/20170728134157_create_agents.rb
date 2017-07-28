class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string     :name
      t.references :type
      t.string     :picture

      t.timestamps
    end
  end
end
