class Currency < ApplicationRecord
  
  scope :currencies_today, ->(kind) { where(currency_kind: Currency.currency_kinds["#{kind}"], 
                                      date: (Date.today.beginning_of_day..Date.today.end_of_day)) }

  scope :currencies_yesterday, ->(kind) { where(currency_kind: Currency.currency_kinds["#{kind}"], 
                                          date: (1.day.ago.beginning_of_day..1.day.ago.end_of_day)) }
                                          
  scope :currencies_last_week, ->(kind) { where(currency_kind: Currency.currency_kinds["#{kind}"], 
                                          date: (1.week.ago..Date.today.end_of_day))}

  validates :date, presence: true
  validates :currency_kind, presence: :true
  validates :value, presence: :true

  enum currency_kind: [:eur, :usd, :aud]
end
