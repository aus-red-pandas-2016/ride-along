class AvailableTripSerializer < ActiveModel::Serializer
  attributes :id, :count, :departure, :arrival, :driver, :rating, :email, :pending

  def driver
    object.driver.name
  end

  def email
    object.driver.email
  end

  def rating
    object.driver.rating
  end

  def pending
    req = object.requests.where(user_id: scope.id)
    exists = req.exists?
    return exists ? req.pluck(:pending).first : false
  end

  def count
    object.riders.count
  end

  def departure
    object.departure_time.strftime("%l:%M %p")
  end

  def arrival
    object.arrival_time.strftime("%l:%M %p")
  end

end
