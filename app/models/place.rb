class Place < ApplicationRecord
	belongs_to :user

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [street, city, state].join(", ")
  end
end
