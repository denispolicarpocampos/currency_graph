namespace :save_currencies do
  desc "Insert all currencies in the database"
  task seed: "db:seed" do
    begin
      res = CurrencyApiService.call
      insert_currencies(res)
    rescue ActiveRecord::StatementInvalid
      
    end
  end
end

def insert_currencies(currencies)
  save_values = select_values(currencies)
  return puts 'Currencies already exists on db!' if save_values.blank?

  save_values.each do |v|
    ActiveRecord::Base.transaction do
      Currency.create(currency_kind: v['currency'], date: v['date'], value: v['value'].to_f)
      print_currency(v['currency'].capitalize, v['date'], v['value'])
    end
  end
  puts 'Currencies was saved on db!' 
end

def select_values(currencies)
  currencies.select {|vl| !check_currency(vl) }
end

def check_currency(currency)
  Currency.exists?(currency_kind: currency['currency'], date: currency['date'], value: currency['value'])
end

def print_currency(currency, date, value)
  puts "#{currency}'s value on #{date}: #{value}"
end