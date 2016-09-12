json.array! @drives do |drive|

  json.id drive.id
  json.departure drive.departure
  json.arrival drive.arrival

  json.riders do
    json.array! drive.riders do |rider|
      json.id rider.id
      json.name rider.name
      json.email rider.email
    end
  end

  json.requests do
    json.array! drive.pending_requests do |request|
      json.id request.id
      json.name request.user.name
      json.email request.user.email
    end
  end
end
