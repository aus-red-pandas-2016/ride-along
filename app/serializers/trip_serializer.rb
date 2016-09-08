class TripSerializer < ActiveModel::Serializer
  attributes :id, :departure, :arrival, :driver, :riders

  def driver
    object.driver.name
  end

  def riders
    object.riders.count
  end

  def departure
    object.departure_time.strftime("%l:%M %p")
  end

  def arrival
    object.arrival_time.strftime("%l:%M %p")
  end

end
