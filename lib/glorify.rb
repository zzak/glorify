require "sinatra/base"
require "glorify/css"
require "glorify/extensions"
require "glorify/version"
require "glorify/renderer"
require "glorify/template"
require "glorify/helpers"

module Sinatra
  module Glorify
    def self.registered(app)
      app.set :glorify_extensions, Glorify::EXTENSIONS
      app.helpers Glorify::Helpers

      app.get '/pygments.css' do
        content_type 'text/css'
        glorify_css
      end
    end
  end

  Tilt.register Glorify::Template, 'markdown', 'mkd', 'md'
  register Glorify
end
