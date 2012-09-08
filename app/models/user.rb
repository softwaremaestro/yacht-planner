class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :avatar, :provider, :uid, :img_url, :access_token

  has_attached_file :avatar, :styles => { :medium => "150x150>", :thumb => "50x50>" }

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    image_url = data.image.gsub("square","large")
    if user = User.find_by_email(data.email)
      if data.image.present?    # update the user's image every time he logs in
        user.update_attribute(:img_url, image_url)
      end
      user
    else # Create a user with a stub password.
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20], :name => data.name, :img_url => image_url, :access_token => access_token.credentials.token)
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"]
        user.img_url = data["image"]
      end
    end
  end

end
