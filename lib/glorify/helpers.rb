module Sinatra
  module Glorify
    # If you want to stick with your current renderer and just render some code
    # blocks within your view, use the Sinatra::Glorify::Helpers.glorify helper
    # method.
    #
    # Depending on the type of application you're building with Sinatra, the manner
    # in which Sinatra::Glorify is used will change.
    #
    # See the Sinatra documentation on {Modular vs. Classic
    # style}[http://www.sinatrarb.com/intro#Modular%20vs.%20Classic%20Style]
    #
    # === With a classical app
    #
    # Simply <code>require 'glorify'</code> to use the helper with a classic
    # style sinatra app.
    #
    #     require 'sinatra'
    #     require 'glorify'
    #     require 'erb'
    #     get '/' do
    #       @example = File.open("#{File.dirname(__FILE__)}/example.md", "rb").read
    #       erb :index
    #     end
    #
    # === With a modular app
    #
    # You will need to <code>register Sinatra::Glorify</code> in your
    # sub-classed app, along with <code>require 'glorify'</code>, to use with a
    # modular style sinatra app.
    #
    #     require 'sinatra/base'
    #     require 'glorify'
    #     require 'erb'
    #     class SubclassedApp < Sinatra::Base
    #       register Sinatra::Glorify
    #       get '/' do
    #         @example = File.open("#{File.dirname(__FILE__)}/example.md", "rb").read
    #         erb :index
    #       end
    #     end
    #
    # === The view
    #
    # This is just a simple +erb+ template, but you get the idea.
    #
    #     <html>
    #       <head>
    #         <link rel="stylesheet" type="text/css" href="/pygments.css" />
    #       </head>
    #       <body>
    #         <%= glorify @example %>
    #       </body>
    #     </html>
    #
    # The default pygments stylesheet that comes with glorify is available at the
    # +/pygments.css+ route.
    #
    module Helpers
      # Convenience method for custom markdown and templates.
      #
      # For modular applications you must add <code>register
      # Sinatra::Helpers</code> to your application.
      def glorify text, options = {}
        Glorify::Renderer.new(options).parse(text.force_encoding('UTF-8'))
      end
    end
  end
end
