require_relative 'spec_helper'

describe Sinatra::Glorify do

  it "should parse a header" do
    mock_app do
      get('/') { markdown :header }
    end
    expected = '<h1 id="label-a+sip+of+glory">a sip of glory<span><a href="#label-a+sip+of+glory">&para;</a> <a href="#documentation">&uarr;</a></span></h1>'
    get('/')
    assert ok?
    assert_equal expected, body
  end

  it "should parse code blocks" do
    mock_app do
      get('/') { markdown :blocks }
    end
    expected = '<pre class="highlight text">&quot;Hello, world!&quot;</pre>'
    get('/')
    assert ok?
    assert_equal expected, body
  end

  it "should parse ruby blocks" do
    mock_app do
      get('/') do
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

  it "should use helper with pipe" do
    mock_app do
      get('/') do
        @some_code = File.open(
          File.expand_path('../glorify/header.md', __FILE__),
          "rb"
        ).read
        erb :helper_with_pipe
      end
    end
    get('/')
    assert ok?
    assert_equal '<h1 id="label-a+sip+of+glory">a sip of glory</h1>', body
  end

  it "should use helper with toc" do
    mock_app do
      get('/') do
        @some_code = File.open(
          File.expand_path('../glorify/header.md', __FILE__),
          "rb"
        ).read
        erb :helper_with_toc
      end
    end
    get('/')
    assert ok?
    assert_equal "<li><a href='#label-a+sip+of+glory'>a sip of glory</a></li>", body
  end

  it "should include a valid css helper for pygments" do
    mock_app
    get('/pygments.css')
    assert ok?

    assert_match /text\/css/, content_type
    assert_empty validate_css(body).errors
  end

  it "should render template with pipe" do
    mock_app do
      get('/') { markdown :header, :pipe => true }
    end
    get('/')
    assert ok?
    assert_equal '<h1 id="label-a+sip+of+glory">a sip of glory</h1>', body
  end

  it "should render template with toc" do
    mock_app do
      get('/') { markdown :header, :toc => true }
    end
    get('/')
    assert ok?
    assert_equal "<li><a href='#label-a+sip+of+glory'>a sip of glory</a></li>", body
  end
end
