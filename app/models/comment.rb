class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :note 

  #VALIDATIONS 
  #presence of note 
  validates :note, presence: true
  
end
