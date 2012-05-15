# glorify

Sinatra helper to parse markdown with syntax highlighting like the pros

Renders via redcarpet with syntax highlighting thanks to [pygments.rb](https://github.com/tmm1/pygments.rb). Able to use
fenced code blocks like github, and includes a default pygments stylesheet.

## install

```bash
gem install glorify
```
or with bundler

```ruby
# Gemfile
source :rubygems
gem 'sinatra'
gem 'glorify'
```

## usage

given the following `markdown` example

    # a sip of glory

    providing a sinatra helper, glorify lets you parse markdown with ease.

    you can even parse code blocks, in any language you'd like. just like you can
    with github flavored markdown. because glorify uses much of the same technology
    as github, you can highlight code from nearly any language, without any extra
    dependencies.

    the snippet below will render a bit of some ruby with syntax highlighting.

    ```ruby
    ['toast', 'cheese', 'wine'].each { |food| print food.capitalize }
    ```

### classical app

simply `require 'glorify'` to use with a classic style sinatra app.

```ruby
require 'sinatra'
require 'glorify'
require 'erb'
get '/' do
  @example = File.open("#{File.dirname(__FILE__)}/example.md", "rb").read
  erb :index
end
```

### modular app

you'll need to `register Sinatra::Glorify` in your sub-classed app, along with
`require 'glorify'`, to use with a modular style sinatra app.

```ruby
require 'sinatra/base'
require 'glorify'
require 'erb'
class SubclassedApp < Sinatra::Base
  register Sinatra::Glorify
  get '/' do
    @example = File.open("#{File.dirname(__FILE__)}/example.md", "rb").read
    erb :index
  end
end
```

### the view

this is just a simple `erb` template, but you get the idea.

```erb
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="/pygments.css" />
  </head>
  <body>
    <%= glorify @example %>
  </body>
</html>
```

## license

```
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
