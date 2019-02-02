class SaveCurrencyService < ApplicationService
  def initialize(values)
    @values = values
  end

  def call
    ActiveRecord::Base.transaction do
      save_values = @values.select {|vl| !check_value(vl) }
      save_values.each { |v| Currency.create(currency_kind: v['currency'], date: v['date'], value: v['value'].to_f) }
    end
  rescue StandardError => e
    puts "#{e}"
  end

  private

  def check_value(v)
    Currency.exists?(currency_kind: v['currency'], date: v['date'], value: v['value'])
  end
end