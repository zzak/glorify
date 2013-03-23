require 'tilt/template'

module Sinatra
  module Glorify
    # Sinatra::Glorify comes with a tilt template for rendering markdown.
    #
    # This allows you to override the default markdown renderer and use
    # +rdoc-rouge+ to highlight any code blocks within your view.
    #
    # In order to do this, you will need to prefer the template class.
    #
    #     Tilt.prefer Sinatra::Glorify::Template
    #
    # Now, any views that render via +markdown+ will use
    # Sinatra::Glorify::Template instead.
    #
    #     register Sinatra::Glorify
    #     get '/' do
    #       markdown :a_view_with_code_blocks
    #     end
    class Template < Tilt::Template
      def prepare # :nodoc:
        @engine = Glorify::Renderer.new(options)
        @output = nil
      end

      def evaluate(scope, locals, &block) # :nodoc:
        @output ||= @engine.parse(data.force_encoding('UTF-8'))
      end
    end
  end
end
