RSpec.configure do |config|
  config.before(:each) do   
    stub_request(:get, /currencydatafeed.com/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
    {
      "status": true,
      "currency": [
        {
          "currency": "EUR/BRL",
          "value": "4.17085",
          "date": "2019-02-01 04:59:59",
          "type": "original"
        },
        {
          "currency": "USD/BRL",
          "value": "3.6442",
          "date": "2019-02-01 04:59:58",
          "type": "original"
        },
        {
          "currency": "AUD/BRL",
          "type": "converted",
          "date": "2019-02-01 04:59:58",
          "value": "2.63986"
        }
      ]
    }', headers: {})
  end
end