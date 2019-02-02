require 'rails_helper'

RSpec.describe Currency, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:currency_kind) }
  it { should validate_presence_of(:value) }
end
