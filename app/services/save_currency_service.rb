require 'rest-client'
require 'json'

class SaveCurrencyService < ApplicationService
  def initialize(values)
    @values = values
  end

  def call
    @values.each { |v| Currency.create(currency_kind: v['currency'], date: v['date'], value: v['value'].to_f) }
      
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end
end