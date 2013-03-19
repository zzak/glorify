require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

module Sinatra
  module Glorify
    class Renderer < Redcarpet::Render::HTML # :nodoc:
      include Rouge::Plugins::Redcarpet
    end
  end
end
