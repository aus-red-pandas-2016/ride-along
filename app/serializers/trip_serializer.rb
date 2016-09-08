class TripSerializer < ActiveModel::Serializer
  attributes :id, :departure_time, :arrival_time, :driver, :riders

  def driver
    Trip.find(object.id).driver   
  end 

  def riders
    Trip.find(object.id).riders   
  end 

  def departure_time 
    object.departure_time.strftime("%l:%M %p")
  end

  def arrival_time 
    object.arrival_time.strftime("%l:%M %p")
  end

end
