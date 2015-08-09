class Identification < ActiveRecord::Base
  attr_accessible :photo_id, :title, :user_id, :image_url, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
