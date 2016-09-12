tom = User.create(name: 'Tom', email: 'tom@tom.tom', password: 'tomtom')
kim = User.create(name: 'Kim', email: 'kim@kim.kim', password: 'kimkim')
cj = User.create(name: 'CJ', email: 'cj@cj.cj', password: 'cjcjcj')
jay = User.create(name: 'Jay', email: 'jay@jay.jay', password: 'jayjay')
sean = User.create(name: 'Sean', email: 'sean@sean.sean', password: 'seansean')
jess = User.create(name: 'Jess', email: 'jess@jess.jess', password: 'jessjess')
tj = User.create(name: 'TJ', email: 'tj@tj.tj', password: 'tjtjtj')


trip1 = Trip.create(departure_time: '2016-09-08 08:00:00', arrival_time: '2016-09-08 08:45:00')
trip2 = Trip.create(departure_time: '2016-09-08 17:00:00', arrival_time: '2016-09-08 17:45:00')
trip3 = Trip.create(departure_time: '2016-09-08 09:00:00', arrival_time: '2016-09-08 09:45:00')
trip4 = Trip.create(departure_time: '2016-09-08 18:00:00', arrival_time: '2016-09-08 18:45:00')
trip5 = Trip.create(departure_time: '2016-09-08 06:00:00', arrival_time: '2016-09-08 07:00:00')
trip6 = Trip.create(departure_time: '2016-09-08 16:00:00', arrival_time: '2016-09-08 17:00:00')


tom.trips = [trip1,trip2]
cj.trips = [trip3,trip4]
sean.trips = [trip5, trip6]

trip1.riders = [kim, jay]
trip2.riders = [kim, jay]
trip3.riders = [tj, jess]
trip4.riders = [tj, jess]
trip5.riders = [jay]
trip6.riders = [jay]

r0 = trip4.requests.create(user_id: 1, pending: true)
r1 = trip4.requests.create(user_id: 2, pending: true)
r2 = trip4.requests.create(user_id: 4, pending: true)
r3 = trip4.requests.create(user_id: 5, pending: true)
