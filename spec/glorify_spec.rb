begin 
  require_relative 'spec_helper'
rescue NameError
  require File.expand_path('../spec_helper', __FILE__)
end

describe Sinatra::Glorify do

  it "should parse a header" do
    mock_app do
      get('/') { erb :header }
    end
    expected = "<h1>a sip of glory</h1>"
    get('/')
    assert ok?
    assert_equal expected, body
  end

  it "should parse code blocks" do
    mock_app do
      get('/') { erb :blocks }
    end
    expected = "<p><code>puts &quot;Hello, world!&quot;</code></p>"
    get('/')
    assert ok?
    assert_equal expected, body
  end

  it "should parse ruby blocks" do
    mock_app do
      get('/') do
        @some_code = File.open(
          File.expand_path('../glorify/some_code.md', __FILE__),
          "rb"
        ).read
        erb :ruby_blocks
      end
    end
    get('/')
    assert ok?
    refute_empty Nokogiri::HTML(body).search("//div[@class = 'highlight']/pre")
  end
end
