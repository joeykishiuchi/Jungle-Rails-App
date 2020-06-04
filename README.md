# Jungle

A mini e-commerce application built with Rails 4.2 adopted from Lighthouse Labs. The purpose of this project was to mimic real-life dev situations such as fixing bugs and implementing features based on legacy code, as well as learning Ruby on Rails.

## Screenshots 

!["Homepage"](https://github.com/joeykishiuchi/Jungle-Rails-App/blob/master/app/assets/images/products.png?raw=true)
!["Cart"](https://github.com/joeykishiuchi/Jungle-Rails-App/blob/master/app/assets/images/my_cart.png?raw=true)
!["Order Receipt"](https://github.com/joeykishiuchi/Jungle-Rails-App/blob/master/app/assets/images/order_receipt.png?raw=true)
!["Signup Page"](https://github.com/joeykishiuchi/Jungle-Rails-App/blob/master/app/assets/images/signup.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
