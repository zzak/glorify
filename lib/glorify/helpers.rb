module Sinatra
  module Glorify
    module Helpers
      def glorify text
        Redcarpet::Markdown.new(Glorify::Renderer.new,
                                Glorify::EXTENSIONS).render(text)
      end
    end
  end
end
