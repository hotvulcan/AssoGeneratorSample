# README

test models 
rails g asso user has_one avatar
    (avatar belongs_to user)
user has_many docs
    (doc belongs_to user)
user many_to_many role
    (
     user has_many user_roles
     user has_many roles
     role has_many user_roles
     role has_many users
     user_roles belongs_to users
     user_roles belongs_to roles 
     
    )

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
