# Sinatra::Glorify

[![Build Status](https://travis-ci.org/zzak/glorify.png?branch=master)](https://travis-ci.org/zzak/glorify)

Sinatra helper to parse markdown with syntax highlighting like the pros

Renders markdown via [rdoc-rouge](https://github.com/zzak/rdoc-rouge), an
[RDoc](https://github.com/rdoc/rdoc) and
[Rouge](https://github.com/jayferd/rouge) bridge.

Able to use fenced code blocks like github, and includes a default pygments
stylesheet.

## Requirements

Ruby 1.9.2 or greater, also supports JRuby and Rubinius when using 1.9 modes.

## Installation

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

## Sinatra::Glorify::Template

Sinatra::Glorify comes with a tilt template for rendering markdown.

This allows you to override the default markdown renderer and use `rdoc-rouge`
to highlight any code blocks within your view.

In order to do this, you will need to prefer the template class.

```ruby
Tilt.prefer Sinatra::Glorify::Template
```

Now, any views that render via `markdown` will use Sinatra::Glorify::Template
instead.

```ruby
register Sinatra::Glorify
get '/' do
  markdown :a_view_with_code_blocks
end
```

## Sinatra::Glorify::Helpers

If you want to stick with your current renderer and just render some code
blocks within your view, use the Sinatra::Glorify::Helpers.glorify helper
method.

Depending on the type of application you're building with Sinatra, the manner
in which Sinatra::Glorify is used will change.

See the Sinatra documentation on [Modular vs. Classic
style](http://www.sinatrarb.com/intro#Modular%20vs.%20Classic%20Style)

### With a classical app

Simply `require 'glorify'` to use the helper with a classic style sinatra app.

```ruby
require 'sinatra'
require 'glorify'
require 'erb'
get '/' do
  @example = File.open("#{File.dirname(__FILE__)}/example.md", "rb").read
  erb :index
end
```

### With a modular app

You will need to `register Sinatra::Glorify` in your sub-classed app, along
with `require 'glorify'`, to use with a modular style sinatra app.

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

### The view

This is just a simple `erb` template, but you get the idea.

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

The default pygments stylesheet that comes with glorify is available at the
`/pygments.css` route.


## Still stuck?

The Sinatra documentation on
[extensions](http://www.sinatrarb.com/extensions.html) does a great job of
explaining how to use and implement extensions using the Sinatra API.


## License

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
