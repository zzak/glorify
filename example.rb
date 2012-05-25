$: << File.expand_path(".") + '/lib'
require 'sinatra'
require 'glorify'
require 'erb'

set :markdown, :layout_engine => :erb
set :views, File.dirname(__FILE__)
Tilt.prefer Sinatra::Glorify::Template

get "/" do
  markdown :README
end

__END__
@@layout
<html>
  <head>
    <link href="/pygments.css" media="screen" rel="stylesheet" type="text/css">
  </head>
  <body><%= yield %></body>
</html>
