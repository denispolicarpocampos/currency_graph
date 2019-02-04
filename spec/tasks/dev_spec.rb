require 'rails_helper'
require './spec/api/api_data.rb'
require 'rake'

describe "rake save_currencies:seed", type: :task do
  context 'curreny is new on db' do
    it 'save currencies on db' do
      Rake::Task['dev:seed'].execute
      expect(Currency.count).to be > 0
    end
  end
end