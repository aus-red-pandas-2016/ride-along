class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of :email

  has_one :work
  has_one :home

  has_many :trips, foreign_key: :driver_id
  has_and_belongs_to_many :rides, class_name: 'Trip', foreign_key: :user_id

  private
  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end

end
