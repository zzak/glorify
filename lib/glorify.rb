require "sinatra/base"
require "glorify/css"
require "glorify/version"
require "glorify/renderer"
require "glorify/template"
require "glorify/helpers"

# Sinatra is a microframework for Ruby
#
# See sinatra on github for more:
# http://github.com/sinatra/sinatra
module Sinatra
  # Sinatra helper to parse markdown with syntax highlighting like the pros
  #
  # {See the README for more info}[http://github.com/zzak/glorify#readme]
  module Glorify
    # Sinatra extension setup to configure the application.
    #
    # Also, registers the Sinatra::Glorify::Helpers and provides the pygments
    # stylesheet route using Sinatra::Glorify::Helpers.glorify_css.
    def self.registered(app)
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
