class Photos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.decimal :long
      t.decimal :lat
      t.string :path_photo
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
