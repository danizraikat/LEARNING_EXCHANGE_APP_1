class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :note 

  #VALIDATIONS
  validates :user, :note, presence: true
  validates :content, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
end
