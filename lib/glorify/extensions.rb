module Sinatra
  module Glorify
    # Helper for Sinatra::Glorify::Renderer default options.
    #
    # Configure in your application through +settings.glorify_extensions+
    EXTENSIONS = { :filter_html => true,
                   :autolink => true,
                   :no_intra_emphasis => true,
                   :fenced_code_blocks => true
                 }
  end
end
