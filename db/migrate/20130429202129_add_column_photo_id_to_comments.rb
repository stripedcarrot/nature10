class AddColumnPhotoIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :references, :photo
  end
end
