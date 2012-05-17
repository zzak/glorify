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
    assert last_response.ok?
    assert_equal expected, body
  end

  it "should parse code blocks" do
    mock_app do
      get('/') { erb :blocks }
    end
    expected = "<p><code>puts &quot;Hello, world!&quot;</code></p>"
    get('/')
    assert last_response.ok?
    assert_equal expected, body
  end

  it "should parse ruby blocks" do
    flunk "NotImplementedError"
  end
end
