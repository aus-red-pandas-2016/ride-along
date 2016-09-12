json.array! @trips do |trip|

  json.id trip.id
  json.departure trip.departure
  json.arrival trip.arrival
  json.count trip.count

  json.driver do
    json.name trip.driver.name
    json.email trip.driver.email
    json.rating trip.driver.rating
  end

  req = trip.requests.where(user_id: @user.id)
  if req.exists?
    json.pending req.pluck(:pending).first
  else
   json.pending false
  end
end
