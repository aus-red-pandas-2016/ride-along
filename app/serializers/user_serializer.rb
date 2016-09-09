class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :trips, :rides

  def trips
    super_trips = object.trips
    super_trips.each do |trip|
      trip[:riders] = trip.riders
    end
    binding.pry
    return super_trips
  end

  def rides
    object.rides
  end
end
