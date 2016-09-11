class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :rating

  def rating
    "4.6"
  end
end
