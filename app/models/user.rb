class User < ActiveRecord::Base
  
  
  mount_uploader :profile_image, ProfileImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable 
  has_many :notes
  has_many :comments  
  has_many :identities, dependent: :destroy   
  

  #VALIDATIONS 
  #websites have to have specific format (SCOPE 2)
  #role (admin, user by default) (SCOPE 1 OR 2) 

  # validates :email, :username, uniqueness: true  
  validates :bio, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
  # validates :email => true  

  

  TEMP_EMAIL_PREFIX = 'change@me' 

  FIELDS = {
    github: {
      email:  [:extra, :raw_info, :email],   
      image: [:info, :image]
    }
  }

  def self.find_for_oauth(auth, signed_in_resource = nil)
    
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    user = self.create_user(auth) if user.nil?

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end

    # Return the user at the end of the method
    user 

  end

  private
    def self.create_user(auth)
      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified

      # Select a user if they have already registered
      user = User.find_by_email(email) if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          first_name: auth.extra.raw_info.first_name,
          # image: auth.info.image || "",
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        # If you use confirmable module 
        # user.skip_confirmation!
        user.save!
      end

      user   
    end
   
end   

