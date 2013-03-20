require "rdoc/rouge"

module Sinatra
  module Glorify
    class Renderer < RDoc::Rouge::Renderer; end # :nodoc:
  end
end
