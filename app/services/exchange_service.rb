require 'rest-client'
require 'json'

class ExchangeService
  def initialize
    @exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url]
    @exchange_api_key = Rails.application.credentials[Rails.env.to_sym][:currency_api_key]
  end


  def perform
    begin
      url = "#{@exchange_api_url}?token=#{@exchange_api_key}&currency=EUR/BRL+USD/BRL+AUD/BRL"
      res = RestClient.get url
      value = JSON.parse(res.body)['currency']
      
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end