require 'delivery'

describe Delivery do
  # test that .checkout(payment)
  # is called on double of order
  # and returns delivery_class.new(@basket)

  subject(:delivery) { described_class.new }
  # double the order
  let(:order) { double :order }
  # stub .checkout order method

  xit "receives basket items after correct payment" do
    # allow delivery to recieve :new with @basket
    allow(:order)
  end

end
