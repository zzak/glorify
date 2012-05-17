ENV['RACK_ENV'] = 'test'
require 'minitest/spec'
require 'minitest/autorun'
require 'rack'

require 'glorify'
require 'rack/test'
require 'sinatra/base'
require 'erb'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :views, File.expand_path('../glorify', __FILE__)
Sinatra::Base.register Sinatra::Glorify

class MiniTest::Spec
  include Rack::Test::Methods

  def mock_app(base=Sinatra::Base, &block)
    @app = Sinatra.new(base, &block)
  end

  def app
    Rack::Lint.new(@app)
  end

  def body
    last_response.body.gsub(/\n/,'')
  end
end
