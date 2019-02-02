require 'rest-client'
require 'json'

class CurrencyApiService < ApplicationService
  def initialize
    @exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url]
    @exchange_api_key = Rails.application.credentials[Rails.env.to_sym][:currency_api_key]
  end

  def call
    url = "#{@exchange_api_url}?token=#{@exchange_api_key}&currency=EUR/BRL+USD/BRL+AUD/BRL"
    res = RestClient.get url
    values = JSON.parse(res.body)['currency']
  rescue RestClient::ExceptionWithResponse => e
    puts "@@@@@"
  end

  def success?
    @values.present?
  end

end