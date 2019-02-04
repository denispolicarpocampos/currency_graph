require 'rails_helper'
require './spec/api/api_data.rb'
require 'rake'

describe "rake save_currencies:seed", type: :task do
  context 'curreny is new on db' do
    it 'save currencies on db' do
      expect{ Rake::Task['save_currencies:seed'].execute }.to change{Currency.count}.by(3)
    end
  end

  context 'currency already was on db' do    
    it 'exclude currencies already saved on db' do
      Currency.create(currency_kind: "EUR/BRL".split('/')[0].downcase, value: "4.17085".to_f, date: "2019-02-01 04:59:59 +0300")
      expect{ Rake::Task['save_currencies:seed'].execute }.to change{Currency.count}.by(2)
    end
  end
end