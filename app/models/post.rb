class Post < ActiveRecord::Base
  belongs_to :category
  attr_accessible :body, :post_at, :published, :title, :created_at, :author

  has_many :comment

  def time_of_post
  	self.post_at || self.created_at
  end
end
