class CreateTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.date :date
      t.integer :parent_id

      t.timestamps
    end
  end
end
