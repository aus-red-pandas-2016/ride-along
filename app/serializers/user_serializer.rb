class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :trips, :rides #, :auth_token
  
  def trips
    User.find(object.id).trips
  end

  def rides
    User.find(object.id).rides
  end
end
