require 'rails_helper'

RSpec.describe Currency, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:type) }
  it 'Raise exception with type of currency is wrong' do
    expect { build(:currency, type: "any") }.to raise_error(ArgumentError)
  end
end
