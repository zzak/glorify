require 'tilt/template'

module Sinatra
  module Glorify
    class Template < Tilt::Template
      def self.engine_initialized?
        defined? Glorify::Template
      end

      def initialize_engine
        require_template_library 'glorify/template'
      end
      
      def prepare
        @engine = Redcarpet::Markdown.new(Glorify::Renderer.new, Glorify::EXTENSIONS)
        @output = nil
      end

      def evaluate(scope, locals, &block)
        @output ||= @engine.render(data)
      end
    end
  end
end
