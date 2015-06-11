class Note < ActiveRecord::Base 
  
  belongs_to :user
  has_and_belongs_to_many :tags

  #VALIDATIONS
  validates :content, length: { maximum: 100,
    too_long: "%{count} characters is the maximum allowed" }
    
end
