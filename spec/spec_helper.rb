require 'rspec'
require 'mocha'
require 'rack/test'

require 'jagger'

RSpec.configure do |config|
  config.mock_with :mocha
  include Rack::Test::Methods
end
