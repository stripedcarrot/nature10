class RenameCollumnParentIdToPhotoId < ActiveRecord::Migration
  def up
    add_column :comments, :photo_id, :integer
  end

  def down
    remove_column :comments, :photo_id
  end
end
