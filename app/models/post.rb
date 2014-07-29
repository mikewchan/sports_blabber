class Post < ActiveRecord::Base
  acts_as_commentable
  attr_accessible :title, :URL, :blabber

  validates :title, :presence => true, :length => { :minimum => 5}
  validates :URL, :presence => true
  
  has_many :comments
  belongs_to :user

end
