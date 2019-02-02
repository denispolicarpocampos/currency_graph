class CurrenciesController < ApplicationController
  def show
    @currencies = params[:id] ? params[:id].downcase : ''
    case @currencies
    when  !Currency.currency_kinds.include?(@currencies) 
      @currencies = {}
    else
      @currencies = set_currencies(@currencies)
    end
  end
  

  private

  def set_currencies(currency_kinds)
    @currencies = Currency.where(currency_kind: Currency.currency_kinds["#{currency_kinds}"])
    @currencies.inject({}) do |new_element, current_element|
      date = current_element.date
      value = current_element.value
      new_element[date] = value
      new_element
    end
  end
end