class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string     :name
      t.references :type, foreign_key: true
      t.string     :picture_uuid

      t.timestamps
    end
  end
end
