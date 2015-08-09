class Comment < ActiveRecord::Base
  attr_accessible :date, :parent_id, :text, :user_id, :photo_id
  belongs_to :photo
  belongs_to :user
  def username
    user.email.split('@').first
  end

  def self.search(search_query)
    if search_query
      find(:all,:conditions => ['text LIKE ?', "%#{search_query}%"])
    else
      find(:all)
    end
  end
end
