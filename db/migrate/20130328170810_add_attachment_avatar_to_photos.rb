class AddAttachmentAvatarToPhotos < ActiveRecord::Migration
  def change
    add_attachment :users, :avatar
  end

  def self.up
    change_table :photos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :photos, :avatar
  end
end
