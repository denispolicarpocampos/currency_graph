class CurrencyRangeService < ApplicationService
  def initialize(kind, range)
    @kind = kind
    @range = range
  end

  def call
    return {} unless Currency.currency_kinds.include?(@kind)

    get_currencies
    
  rescue StandardError => e
    puts "#{e}"
  end

  private

  def get_currencies
    case @range
      when 0
        @currencies = Currency.currencies_today(@kind)
      when 1
        @currencies = Currency.currencies_yesterday(@kind)
      when 2
        @currencies = Currency.currencies_last_week(@kind)
    else
      @currencies = Currency.currencies_today(@kind)
    end
    set_currencies
  end

  def set_currencies
    @currencies.inject({}) do |new_element, current_element|
      date = current_element.date
      value = current_element.value
      new_element[date] = value
      new_element
    end
  end
end