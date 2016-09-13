json.array! @matches do |match|

  json.id match.id
  json.departure match.departure
  json.arrival match.arrival
  json.count match.count

  json.driver do
    json.name match.driver.name
    json.email match.driver.email
    json.rating match.driver.rating
  end

  request = match.requests.where(user_id: @user.id)
  if request.exists?
    json.pending request.pluck(:pending).first
  else
   json.pending false
  end
end
