class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :post, :user_id

  #for user comment
  belongs_to :user
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
