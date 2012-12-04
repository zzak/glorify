require "redcarpet"
require "pygments.rb"

module Sinatra
  module Glorify
    class Renderer < Redcarpet::Render::HTML # :nodoc:

      def block_code(code, lang) # :nodoc:
        Pygments.highlight(code, :lexer => lang, :options => {:encoding => "utf-8"})
      end

    end
  end
end
