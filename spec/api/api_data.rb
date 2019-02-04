require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

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
          "date": "2019-02-01 04:59:59 +0300",
          "type": "original"
        },
        {
          "currency": "USD/BRL",
          "value": "3.6442",
          "date": "2019-02-01 04:59:58 +0300",
          "type": "original"
        },
        {
          "currency": "AUD/BRL",
          "type": "converted",
          "date": "2019-02-01 04:59:58 +0300",
          "value": "2.63986"
        }
      ]
    }', headers: {})

    stub_request(:get, /economia.awesomeapi.com.br/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      [
        {
          "varBid": "0.0002",
          "code": "AUD",
          "codein": "BRL",
          "name": "Dólar Australiano",
          "high": "2.6549",
          "low": "2.6454",
          "pctChange": "0.01",
          "bid": "2.6503",
          "ask": "2.6508",
          "timestamp": "1549247616",
          "create_date": "2019-02-04 00:33:37"
        },
        {
          "varBid": "0.0022",
          "high": "2.6533",
          "low": "2.6509",
          "pctChange": "0.08",
          "bid": "2.6521",
          "ask": "2.653",
          "timestamp": "1549238396"
        },
        {
          "varBid": "0.0017",
          "high": "2.6731",
          "low": "2.637",
          "pctChange": "0.06",
          "bid": "2.6532",
          "ask": "2.6552",
          "timestamp": "1549061194"
        },
        {
          "varBid": "-0.001",
          "high": "2.6515",
          "low": "2.6483",
          "pctChange": "-0.04",
          "bid": "2.6495",
          "ask": "2.6504",
          "timestamp": "1548979196"
        },
        {
          "varBid": "0.0029",
          "high": "2.6736",
          "low": "2.6685",
          "pctChange": "0.11",
          "bid": "2.6727",
          "ask": "2.6732",
          "timestamp": "1548892797"
        },
        {
          "varBid": "0.0015",
          "high": "2.6637",
          "low": "2.6598",
          "pctChange": "0.06",
          "bid": "2.6621",
          "ask": "2.663",
          "timestamp": "1548806395"
        },
        {
          "varBid": "0.0006",
          "high": "2.6963",
          "low": "2.693",
          "pctChange": "0.02",
          "bid": "2.6943",
          "ask": "2.6969",
          "timestamp": "1548719995"
        }
      ]', headers: {})

  end
end