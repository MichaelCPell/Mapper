class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :url
      t.integer :sq_foot
      t.integer :re_type
      t.integer :term
      t.string :city

      t.timestamps
    end
  end
end
