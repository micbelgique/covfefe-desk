class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.references :type
      t.datetime   :datetime
      t.references :agent
      t.references :patient

      t.timestamps
    end
  end
end
