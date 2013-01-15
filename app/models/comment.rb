class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :author, :body, :is_approved, :is_poster, :title
end
