tom = User.create(name: 'Tom', email: 'tom@tom.tom', password: 'tomtom')
kim = User.create(name: 'Kim', email: 'kim@kim.kim', password: 'kimkim')


trip1 = Trip.create(departure_time: '2016-09-08 08:00:00', arrival_time: '2016-09-08 08:45:00')
trip2 = Trip.create(departure_time: '2016-09-08 17:00:00', arrival_time: '2016-09-08 17:45:00')
trip3 = Trip.create(departure_time: '2016-09-09 08:00:00', arrival_time: '2016-09-09 08:45:00')
trip4 = Trip.create(departure_time: '2016-09-09 17:00:00', arrival_time: '2016-09-09 17:45:00')

tom.trips = [trip1,trip2,trip3,trip4]

trip1.riders << kim
trip2.riders << kim
trip3.riders << kim
trip4.riders << kim