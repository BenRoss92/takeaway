require_relative 'menu'
require_relative 'delivery'

class Order

  attr_reader :menu, :basket

  def initialize(menu = Menu.new, delivery_class = Delivery)
    @menu = menu
    @basket = {}
    @delivery_class = delivery_class
  end

  def add_order(item,quantity)
    @basket[item] = quantity
  end

  def total
    prices = @basket.map do |item,quantity|
      @menu.dishes[item] * quantity
    end
    prices.inject(:+)
  end

  def summary
    message_1 = @basket.map do |item,quantity|
      price = @menu.dishes[item] * quantity
      "#{quantity} x #{item} - £#{price}\n"
    end
    message_1.join + "Total - £#{total}"
  end

  def checkout(payment)
    if payment == total
      @delivery_class.new(@basket)
    else
      raise "Invalid payment amount"
    end
  end

end
