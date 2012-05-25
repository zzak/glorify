module Sinatra
  module Glorify
    EXTENSIONS = { :filter_html => true,
                   :autolink => true,
                   :no_intra_emphasis => true,
                   :fenced_code_blocks => true
                 }
  end
end
