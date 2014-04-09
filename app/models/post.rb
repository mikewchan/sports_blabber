class Post < ActiveRecord::Base
  acts_as_commentable
  attr_accessible :content, :name, :title

  validates :content, :presence => true, :length => { :minimum => 10}
  validates :title, :presence => true
  validates :name, :presence => true

end
