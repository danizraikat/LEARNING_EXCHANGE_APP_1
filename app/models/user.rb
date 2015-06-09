class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes
  has_many :comments  

  #VALIDATIONS 
  #websites have to have specific format (SCOPE 2)
  #role (admin, user by default) (SCOPE 1 OR 2) 

  validates :email, :username, uniqueness: true  
  validates :bio, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
  # validates :email => true  
   
end   

