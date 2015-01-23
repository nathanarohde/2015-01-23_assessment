Hair Salon

by Monty Rohde

Ruby version 2.20

Hair salon is a set of classes and methods used to associate hair salon stylists and customers.


Install Hair Salon by first cloning the repository:
git clone https://github.com/nathanarohde/2015-01-23_assessment.git

Install all of the required gems in irb:
$ bundle install
$ bundle

This will install the following gems.
backports (3.6.4)
multi_json (1.10.1)
rack (1.6.0)
rack-protection (1.5.3)
  rack
rack-test (0.6.3)
  rack (>= 1.0)
sinatra (1.4.5)
  rack (~> 1.4)
  rack-protection (~> 1.4)
  tilt (~> 1.3, >= 1.3.4)
sinatra-contrib (1.4.2)
  backports (>= 2.0)
  multi_json
  rack-protection
  rack-test
  sinatra (~> 1.4.0)
  tilt (~> 1.3)
tilt (1.4.1)

Start the database
$ postgres
$ psql

#CREATE DATABASE hair_salon;
#\c hair_salon
#CREATE TABLE stylists(name varchar, id serial PRIMARY KEY);
#CREATE TABLE clients(name varchar, stylist_id int, id serial PRIMARY KEY);
