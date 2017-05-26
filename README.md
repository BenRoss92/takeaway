# Takeaway

## Required before running

1. Register for a free Twilio account at https://www.twilio.com using your mobile number to get a Twilio number.
2. Clone and open this repository - `$ git clone git@github.com:BenRoss92/takeaway.git && cd takeaway`
3. Install gems using Bundler - run `$ bundle install`
4. Add a new `.env` file in the root directory of this repository, then add your twilio number and mobile number to the file as follows, making sure to save the file:
```
TWILIO_NUMBER=EnterYourTwilioNumberHere
MY_NUMBER=EnterYourMobileNumberHere
```

## Using the app

In the command line, do the following:

```ruby
# Load order.rb file:
$ irb -r './lib/order.rb'

# Make a new order:
order = Order.new

# Add dishes from the menu to your order:
order.add_order(:burger,3)
order.add_order(:fries,2)

# View your current basket of items:
order.basket

# Calculate the total price of your basket:
order.total

# View a summary of your order:
order.summary

# To place a delivery, enter the correct total basket price into `checkout()` (e.g. if your total basket price is 32, enter '32 into `checkout()`):
order.checkout(32)
# N.B. If the amount entered is incorrect, an error will be raised and the order will not be placed. 

# If the total amount was correct, you should receive a text message to your registered Twilio phone number containing a summary of your order and a delivery time estimate:
# e.g. "Thank you! Your order was placed and will be delivered before
# {YOUR DELIVERY TIME} - #{YOUR ORDER SUMMARY}"
```

## User Stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
