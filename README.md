# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Intro
This is a simple web application built with Ruby on Rails. It can be used for basic accounting and can be run using docker. 

* Ruby version
This app uses Ruby 3.0.0

* System dependencies
Depends on Rails 6.1.4, Postgresql 9.3



* Deployment instructions
## Running application without without Docker
You can run the application locally without using Docker if you have Ruby 3.0.0 installed. The other gems can be installed by running the following command:
1. `bundle install` 
2. Replace db with localhost as the host value in database.yml
3. Run `rails s` to run the application
4. Then point your browswer to http://localhost:3000 to view app

## Running application inside Docker container
This is the preferred way to run the application.
Run the commands below in the following order: 
1. `docker-compose build`
2. `docker-compose run web rails db:setup` to create development and test databases and seed development database. Alternatively you could:
run `docker-compose run web rails db:create` to create the development and test databases and then run `docker-compose run web rails db:seed` to seed the development database with sample data
3. `docker-compose run web rails db:migrate` to run migrations
4. `docker-compose run web rails s` to start the web server(puma)
5. Point your browser to http://localhost:3000
* ...
