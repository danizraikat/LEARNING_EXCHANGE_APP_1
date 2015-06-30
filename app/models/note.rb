class Note < ActiveRecord::Base 
  
  belongs_to :user
  has_many :comments 
  has_and_belongs_to_many :tags
  belongs_to :favorites

  #VALIDATIONS
  validates :user, presence: true
  validates :content, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
      
end
