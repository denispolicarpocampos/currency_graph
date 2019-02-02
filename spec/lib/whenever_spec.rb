require 'rails_helper'
require 'whenever'

describe 'task' do
  before do
    load 'Rakefile' # Makes sure rake tasks are loaded so you can assert in rake jobs
  end
  
  it 'makes sure `rake` statements exist' do
    # config/schedule.rb file is used by default in constructor:
    schedule = Whenever::Test::Schedule.new(vars: { environment: 'staging' })

    # Makes sure the rake task is defined:
    assert Rake::Task.task_defined?(schedule.jobs[:rake].first[:task])
  end
end