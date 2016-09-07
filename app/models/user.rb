class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :email
  # validates_uniqueness_of :email, :auth_token

  # before_create :generate_authentication_token!

  has_one :work
  has_one :home

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
