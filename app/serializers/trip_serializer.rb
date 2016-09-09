class TripSerializer < ActiveModel::Serializer
  attributes :id, :departure, :arrival, :driver, :email, :rating, :count, :riders

  def driver
    object.driver.name
  end

  def rating
    "%0.1f" % rand(3.5..4.8)
  end

  def email
    object.driver.email
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
