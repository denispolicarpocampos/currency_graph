class Currency < ApplicationRecord
  validates :date, presence: true
  validates :currency_kind, presence: :true
  validates :value, presence: :true
end
