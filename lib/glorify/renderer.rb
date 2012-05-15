require "redcarpet"
require "pygments.rb"

module Sinatra
  module Glorify
    class Renderer < Redcarpet::Render::HTML

      def initialize(options={})
        python = ENV['GLORIFY_PYTHON'] || 'python'
        RubyPython.configure :python_exe => python
        super
      end

      def block_code(code, lang)
        begin
          Pygments.highlight(code, :lexer => lang, :options => {:encoding => "utf-8"})
        rescue RubyPython::PythonError
          Pygments.highlight(code, :options => {:encoding => "utf-8"})
        end
      end

    end
  end
end
