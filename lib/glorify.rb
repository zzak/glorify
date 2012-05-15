require "sinatra/base"
require "glorify/css"
require "glorify/version"
require "glorify/renderer"

module Sinatra
  module Glorify
    module Helpers
      def glorify text
        rndr = Glorify::Renderer.new
        Redcarpet::Markdown.new(rndr, settings.glorify_extensions).render(text)
      end
    end

    def self.registered(app)
      app.set :glorify_extensions, { :filter_html => true,
                                     :autolink => true,
                                     :no_intra_emphasis => true,
                                     :fenced_code_blocks => true
                                    }
      app.helpers Glorify::Helpers
      app.get '/pygments.css' do
        glorify_css
      end
    end
  end

  register Glorify
end
