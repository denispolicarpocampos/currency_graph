FactoryBot.define do
  factory :currency do
    currency_kind        { "eur" }
    value        { "4.17085".to_f }
    date     { "2019-02-01 04:59:59 +0300" }
  end
end