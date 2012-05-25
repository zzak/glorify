require 'redcarpet' unless defined? Redcarpet
require 'tilt/template'

module Sinatra
  module Glorify
    class Template < Tilt::Template
      def prepare
        @engine = Redcarpet::Markdown.new(Glorify::Renderer.new,
                                          Glorify::EXTENSIONS)
        @output = nil
      end

      def evaluate(scope, locals, &block)
        @output ||= @engine.render(data)
      end
    end
  end
end
