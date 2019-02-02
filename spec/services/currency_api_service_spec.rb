require 'spec_helper'
require './spec/api/api_data.rb'

describe 'CurrencyApiService' do
  it 'got currencies' do
    res = CurrencyApiService.call
    expect(res[0].values).to eql(["EUR/BRL", "4.17085", "2019-02-01 04:59:59", "original"])
  end
end