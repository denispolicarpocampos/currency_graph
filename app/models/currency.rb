class Currency < ApplicationRecord
  validates :type , presence: true
  validates :date, presence: true

  enum type: [:eur, :usd, :aur]
end
