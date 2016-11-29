require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'initializes with the correct dishes' do
    expect(menu.dishes).to include(burger: 9, fries: 3, sandwich: 6)
  end

  it 'displays list of dishes to user' do
    expect(menu.display_menu).to eq("burger - 9, fries - 3, sandwich - 6")
  end

end
