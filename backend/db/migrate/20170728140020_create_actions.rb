class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.references :type,    foreign_key: true
      t.date       :date
      t.references :agent,   foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
