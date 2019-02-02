require 'spec_helper'
require './spec/api/api_data.rb'

describe 'SaveCurrencyService' do
  context 'saved' do
    it 'save currencies' do
      res = CurrencyApiService.call
      expect{ SaveCurrencyService.call(res) }.to change{Currency.count}.by(3)
    end
  end
end