ENV['RACK_ENV'] = 'test'
require 'minitest/spec'
require 'minitest/autorun'
require 'rack'

require 'glorify'
require 'nokogiri'
require 'rack/test'
require 'sinatra/base'
require 'erb'
require 'w3c_validators'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :views, File.expand_path('../glorify', __FILE__)
Sinatra::Base.register Sinatra::Glorify

class MiniTest::Spec
  include Rack::Test::Methods
  include W3CValidators

  def mock_app(base=Sinatra::Base, &block)
    @app = Sinatra.new(base) do
      Tilt.prefer Sinatra::Glorify::Template
      class_eval &block if block_given?
    end
  end

  def app
    Rack::Lint.new(@app)
  end

  def body
    last_response.body.gsub(/\n/,'')
  end

  def ok?
    last_response.ok?
  end

  def content_type
    last_response.headers['Content-Type']
  end

  def validate_css(css)
    CSSValidator.new.validate_text css
  end
end
