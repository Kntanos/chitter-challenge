# Chitter Challenge
====================

Connect to `psql` and create the `chitter` and the `chitter_test` databases:
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```
to set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

The app satisfies the first 4 user stories:
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

Passwords are encrypted using BCrypt and users cannot sign up without a valid email address.
Email addresses and usernames must be unique.

The app is built using:  
Ruby  
Sinatra  
Rspec  
Capybara  
HTML

There is no CSS styling. 

Run the app with `rackup` or `ruby app.rb`