class AddClassficationToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :classification, :text
  end
end
