class Photo < ActiveRecord::Base
  attr_accessible :lat, :long, :path_photo, :title, :user_id, :avatar, :classification, :description
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
  belongs_to :user
  has_many :comments

  def username
    user.email.split('@').first
  end


  def self.search search_query

    if search_query
      find :all, conditions: ["title LIKE ? OR classification LIKE ? OR description LIKE ?",
                              "%#{search_query}%", "%#{search_query}%", "%#{search_query}%"]
    else
      find :all
    end

  end
  def previous
    Photo.where(["id < ?", id]).last
  end

  def next
    Photo.where(["id > ?", id]).first
  end

end

