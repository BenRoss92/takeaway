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

```
# Load order.rb file:
$ irb -r './lib/order.rb'

# Make a new order:
order = Order.new

# Add dishes from menu into order:
order.add_order(:burger,3)
order.add_order(:fries,2)

# View your current basket of items:
order.basket

# Calculate total price of basket items:
order.total

# See a summary of your order:
order.summary

# Enter your correct total amount when checking out to place a delivery (e.g. if total is 32):
order.checkout(32)

## If total amount was correct, you should receive a text containing a summary of your order and a delivery time estimate:
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
