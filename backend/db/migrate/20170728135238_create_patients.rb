class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string  :name
      t.date    :birth_date
      t.text    :code
      t.string  :picture_uuid
      t.decimal :latitude,  :precision => 15, :scale => 10, :default => 0.0
      t.decimal :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.text    :address

      t.timestamps
    end
  end
end
