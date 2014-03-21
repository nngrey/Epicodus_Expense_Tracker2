require 'item'
require 'category'
require 'pg'
require 'rspec'

DB = PG.connect({:dbname => 'expenses'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM items *;")
    DB.exec("DELETE FROM categories *;")
  end
end
