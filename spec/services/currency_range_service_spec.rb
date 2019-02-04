require 'rails_helper'

describe 'CurrencyRangeService' do
  context 'valid range' do
    let!(:currency_1) { create(:currency, date: DateTime.now) }
    let!(:currency_2) { create(:currency, date: DateTime.now - 1.days) }
    let!(:currency_3) { create(:currency, date: DateTime.now - 7.days) }
    let!(:currency_4) { create(:currency, date: DateTime.now.end_of_day - 7.days) }
    let!(:currency_5) { create(:currency, date: DateTime.now - 6.days) }
    let!(:currency_6) { create(:currency, date: DateTime.now - 5.days) }
    let!(:currency_7) { create(:currency, date: DateTime.now - 4.days) }
    let!(:currency_8) { create(:currency, date: DateTime.now - 3.days) }


    it 'to get currencies of 7 days' do
      res = { currency_3['date'] => currency_3['value'] }
      expect(CurrencyRangeService.call('eur', 2).to_s).to eql("#{res}")
    end
  end

  
end