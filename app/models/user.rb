class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable, 
  :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  has_many :pins

  # Uploading of image using AWS S3
  has_attached_file :pin,
  :styles =>{
    :thumb  => "50x50",
    :medium => "400x400"
  },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml"",
  :path => ":attachment/:id/:style.:extension",
  :bucket => "OMRails2"

end
