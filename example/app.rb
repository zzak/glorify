require 'rubygems'
require 'sinatra'
require 'glorify'
require 'erb'

get '/' do
  @example = File.open("#{File.dirname(__FILE__)}/example.md", "rb").read
  erb :index
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
