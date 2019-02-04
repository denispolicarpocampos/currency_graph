namespace :dev do
  desc "Insert all currencies in the database"
  task seed: "db:seed" do
    begin
      request_currencies('EUR-BRL')
      request_currencies('USD-BRL')
      request_currencies('AUD-BRL')
      puts 'Currencies was saved on db!' 
    rescue StandardError => e
      puts 'Something wrong. Currencies was not saved!'
    end
  end
end

def request_currencies(currency_kind)
  url = "https://economia.awesomeapi.com.br/json/list/#{currency_kind}/7"
  res = RestClient.get url
  values = JSON.parse(res.body)
  insert(values, currency_kind)
end

def insert(currencies, kind)
  currencies.each do |v|
    ActiveRecord::Base.transaction do
      Currency.create(currency_kind: kind.split('-')[0].downcase, date: DateTime.strptime("#{v['timestamp']}",'%s'), value: v['bid'].to_f)
    end
  end
end