class Note < ActiveRecord::Base 
  
  belongs_to :user
  has_many :comments 
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :favorites
  # belongs_to :favorites

  #VALIDATIONS
  validates :user, presence: true
  validates :content, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
  
  acts_as_votable  

  def number_of_likes
    get_likes.size
  end
       
end

