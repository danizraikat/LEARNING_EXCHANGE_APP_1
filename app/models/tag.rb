class Tag < ActiveRecord::Base
  
  has_and_belongs_to_many :notes  

  validates :title, uniqueness: true     
     
end
