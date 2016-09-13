class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email

  has_one :work
  has_one :home

  has_and_belongs_to_many :rides, class_name: 'Trip', foreign_key: :user_id

  has_many :trips, foreign_key: :driver_id
  has_many :places
  has_many :requests

  def matches
    Trip.includes(:requests).available_to(self) - self.rides
  end

  def rating
    "4.7"
  end
end
