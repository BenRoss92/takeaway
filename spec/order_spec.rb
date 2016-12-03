require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:delivery) { double :delivery }
  let(:delivery_class) { double :delivery_class, new: delivery }

  before(:each) do
    order.add_order(:burger,3)
    order.add_order(:fries,2)
  end

  it 'adds orders to the basket' do
    expect(order.basket).to include(:burger=>3, :fries=>2)
  end

  it 'calculates the total of the basket' do
    expect(order.total).to eq(33)
  end

  it 'displays a summary of the order' do
    expect(order.summary).to eq("3 x burger - £27\n2 x fries - £6\nTotal - £33")
  end

  it 'raises error if payment does not match total' do
    expect{order.checkout(32)}.to raise_error("Invalid payment amount")
  end

  xit 'starts a delivery if payment matches total' do
    allow(delivery_class).to receive(:new) { :delivery }
    order.checkout(33)
    expect(delivery).to have_received(:send_sms)
  end

end
