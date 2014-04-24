class Post < ActiveRecord::Base
  acts_as_commentable
  attr_accessible :title, :URL

  validates :title, :presence => true, :length => { :minimum => 5}
  validates :URL, :presence => true
  

end
