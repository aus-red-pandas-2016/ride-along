class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :rides, :name, :trips

  has_many :trips, serializer: TripSerializer
end
