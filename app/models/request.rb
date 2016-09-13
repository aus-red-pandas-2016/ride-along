class Request < ApplicationRecord
  validates :user, uniqueness: { scope: :trip }

  belongs_to :user
  belongs_to :trip
end
