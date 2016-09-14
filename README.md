# Ride-Along API 

## Team Members

- CJ Jessett - cjessett
- Tom Ho - TomHoDev
- Kimberly Patton - kimberlypatton

## Project Description

This API is used in conjunction with [Ride-Along-UI](https://github.com/TomHoDev/ride-along-ui) to connect users to carpool. 

Users can post rides that they provide or join a ride that is near them. 

## Installation 
To install the app to your local computer run

    git clone https://github.com/TomHoDev/ride-along

Switch into the app directory

    cd /ride-along

Install the necessary gems

    bundle install

Create and migrate your database

    rake db:create
    rake db:migrate

Optionally, you can seed the database with 

    rake db:seed

## How To Use
Start the server

    rails s 

You can build your own front end that uses the api. 
Endpoint examples to come...

Pull down the font end UI. [Ride-Along-UI](https://github.com/TomHoDev/ride-along-ui)

#Coming Features
Improve ride searching function by adding geolocation


