class Identification < ActiveRecord::Migration
  def change
    create_table :identifications do |t|
      t.integer :photo_id
      t.integer :user_id
      t.text :title

      t.timestamps
    end
  end
end
