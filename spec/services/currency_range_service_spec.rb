require 'rails_helper'

describe 'CurrencyRangeService' do
  context 'valid range' do
    let!(:currency_1) { create(:currency, date: DateTime.now) }
    let!(:currency_2) { create(:currency, date: DateTime.now - 1.days) }
    let!(:currency_3) { create(:currency, date: DateTime.now - 7.days) }

    it 'to get currency of today' do
      res = { currency_1['date'] =>currency_1['value']}
      expect(CurrencyRangeService.call('eur', 0).to_s).to eql("#{res}")
    end

    it 'to get currency of today' do
      res = { currency_2['date'] =>currency_2['value']}
      expect(CurrencyRangeService.call('eur', 1).to_s).to eql("#{res}")
    end

    it 'to get currencies of 7 days' do
      res = { currency_1['date'] =>currency_1['value'] , currency_2['date'] =>currency_2['value'], currency_3['date'] => currency_3['value'] }
      expect(CurrencyRangeService.call('eur', 2).to_s).to eql("#{res}")
    end
  end

  
end