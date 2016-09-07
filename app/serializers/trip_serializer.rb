class TripSerializer < ActiveModel::Serializer
  attributes :id, :departure_time, :arrival_time, :driver, :riders

  def driver
    Trip.find(object.id).driver   
  end 

  def riders
    Trip.find(object.id).riders   
  end 

end
