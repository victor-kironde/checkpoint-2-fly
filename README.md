Rails-Fly is a flight booking application built with Ruby On Rails.

# Rails-Fly


# Description

Rails-Fly is a flight booking application built with Ruby On Rails.

It enables users to search for available flights and book for them.

You can get started here: [rails-fly.herokuapp.com](https://rails-fly.herokuapp.com)

# Features

To book a flight, visit the [homepage](https://rails-fly.herokuapp.com), select the Origin, Destination, Number of Passengers and Date from the corresponding drop-downs.
Registered users will recieve a confirmation email with their bookings details and can also view all their past bookings.

# Dependencies

### Install dependencies

You need to install the following:

1. [Ruby](https://github.com/rbenv/rbenv)
2. [PostgreSQL](http://www.postgresql.org/download/macosx/)
3. [Bundler](http://bundler.io/)
4. [Rails](http://guides.rubyonrails.org/getting_started.html#installing-rails)
5. [RSpec](http://rspec.info/)


# Running the application

### Clone the repository

Clone the application to your local machine:

```
$ git clone https://github.com/andela-vkironde/checkpoint-2-fly.git
```

```cd``` into the application's root directory


Install the dependencies

```
$ bundle
```

Setup database and seed data

```
$ rake db:setup
```

To run the application

```
$ rails server
```
Visit `http://localhost:3000` to view the application in your preferred web browser.

# Testing

To run the tests, run
```
$ rspec spec
```

### Limitations

- Payment with Paypal
