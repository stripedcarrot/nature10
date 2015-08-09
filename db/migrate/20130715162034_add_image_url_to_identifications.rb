class AddImageUrlToIdentifications < ActiveRecord::Migration
  def change
    add_column :identifications, :image_url, :string
  end
end
