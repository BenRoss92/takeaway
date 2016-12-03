require 'delivery'

describe Delivery do
  let(:summary) { double :summary }
  subject(:delivery) { described_class.new(:summary) }
  let(:delivery_class) { double :delivery_class }
  let(:payment) { double :payment }
  let(:order) { double :order }

  it "receives basket items after correct payment" do
    allow(order).to receive(:checkout) { payment }
    allow(delivery_class).to receive(:new).with(summary)
    allow(delivery).to receive(:send_sms)
    order.checkout(payment)
    expect(delivery).to receive(:send_sms)
    delivery.send_sms
  end

end
