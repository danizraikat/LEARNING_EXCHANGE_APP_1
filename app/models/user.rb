class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes
  has_many :comments  

  #VALIDATIONS 
  #username and email have to be unique
  #bio has to have a character limit
  #websites have to have specific format 

  validates :email, :username, uniqueness: true  
  validates :bio, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
  validates :my_email_attribute, :email => true  
end   

