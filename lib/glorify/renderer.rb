require "redcarpet"
require "albino"
require "net/http"

module Sinatra
  module Glorify
    class Renderer < Redcarpet::Render::HTML
      attr_reader :use_albino

      def initialize(options={})
        @use_albino = options.fetch(:use_albino, true)
        super
      end

      def block_code(code, lang)
        if use_albino
          Albino.colorize(code, lang)
        else
          Net::HTTP.post_form(URI.parse('http://pygments.appspot.com/'),
                              {'code'=>code, 'lang'=>lang}).body
        end
      end
    end
  end
end
