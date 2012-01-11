require 'rubygems'
require 'sinatra/base'
require 'glorify'
require 'erb'

class SubclassedApp < Sinatra::Base
  register Sinatra::Glorify
  
  set :views, File.dirname(__FILE__)
  enable :inline_templates

  get '/' do
    @example = File.open("#{File.dirname(__FILE__)}/example.md", "rb").read
    erb :index
  end

  run! if app_file == $0
end

__END__
@@layout
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="/pygments.css" />
  </head>
  <body>
    <%= yield %>
  </body>
</html>

@@index
<%= glorify @example %>
