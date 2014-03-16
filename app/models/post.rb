class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  attr_accessible :body, :title

  default_scope_order('created_at DESC')
end
