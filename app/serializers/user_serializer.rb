class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :trips, :rides

  def trips
    object.trips
  end

  def rides
    object.rides
  end
end
