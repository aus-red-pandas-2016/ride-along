class Trips::AvailableSerializer < TripSerializer
  embed :ids, include: true
  belongs_to :driver, key: :user

  # def pending
  #   req = object.requests.where(user_id: scope.id)
  #   exists = req.exists?
  #   return exists ? req.pluck(:pending).first : false
  # end
end
