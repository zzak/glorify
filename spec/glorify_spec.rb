require_relative 'spec_helper'

describe Sinatra::Glorify do

  it "should parse a header" do
    mock_app do
      Tilt.prefer Sinatra::Glorify::Template
      get('/') { markdown :header }
    end
    expected = "<h1 id=\"label-a+sip+of+glory\">a sip of glory<span><a href=\"#label-a+sip+of+glory\">&para;</a> <a href=\"#documentation\">&uarr;</a></span></h1>"
    get('/')
    assert ok?
    assert_equal expected, body
  end

  it "should parse code blocks" do
    mock_app do
      Tilt.prefer Sinatra::Glorify::Template
      get('/') { markdown :blocks }
    end
    expected = "<pre class=\"highlight text\">&quot;Hello, world!&quot;</pre>"
    get('/')
    assert ok?
    assert_equal expected, body
  end

  it "should parse ruby blocks" do
    mock_app do
      get('/') do
        Tilt.prefer Sinatra::Glorify::Template
        markdown :ruby_blocks
      end
    end
    get('/')
    assert ok?
    refute_empty Nokogiri::HTML(body).search("pre.highlight")
  end

  it "should parse with a helper" do
    mock_app do
      get('/') do
        @some_code = File.open(
          File.expand_path('../glorify/some_code.md', __FILE__),
          "rb"
        ).read
        erb :with_helper
      end
    end
    get('/')
    assert ok?
    refute_empty Nokogiri::HTML(body).search("pre.highlight")
  end

  it "should include a valid css helper for pygments" do
    mock_app
    get('/pygments.css')
    assert ok?

    assert_match /text\/css/, content_type
    assert_empty validate_css(body).errors
  end
end
