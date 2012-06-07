PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path('../../config/boot', __FILE__)

class MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    MeNotes.tap { |app|  }         
  end
end