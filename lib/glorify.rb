require "sinatra/base"
require "glorify/version"
require "glorify/renderer"

module Sinatra
  module Glorify
    module Helpers
      def glorify text
        rndr = Glorify::Renderer.new(:use_albino => settings.use_albino)
        Redcarpet::Markdown.new(rndr, settings.glorify_extensions).render(text)
      end

      def glorify_css
        <<-css
          .hll { background-color: #ffffcc }
          .c { color: #888888 } /* Comment */
          .err { color: #a61717; background-color: #e3d2d2 } /* Error */
          .k { color: #008800; font-weight: bold } /* Keyword */
          .cm { color: #888888 } /* Comment.Multiline */
          .cp { color: #cc0000; font-weight: bold } /* Comment.Preproc */
          .c1 { color: #888888 } /* Comment.Single */
          .cs { color: #cc0000; font-weight: bold; background-color: #fff0f0 } /* Comment.Special */
          .gd { color: #000000; background-color: #ffdddd } /* Generic.Deleted */
          .ge { font-style: italic } /* Generic.Emph */
          .gr { color: #aa0000 } /* Generic.Error */
          .gh { color: #303030 } /* Generic.Heading */
          .gi { color: #000000; background-color: #ddffdd } /* Generic.Inserted */
          .go { color: #888888 } /* Generic.Output */
          .gp { color: #555555 } /* Generic.Prompt */
          .gs { font-weight: bold } /* Generic.Strong */
          .gu { color: #606060 } /* Generic.Subheading */
          .gt { color: #aa0000 } /* Generic.Traceback */
          .kc { color: #008800; font-weight: bold } /* Keyword.Constant */
          .kd { color: #008800; font-weight: bold } /* Keyword.Declaration */
          .kn { color: #008800; font-weight: bold } /* Keyword.Namespace */
          .kp { color: #008800 } /* Keyword.Pseudo */
          .kr { color: #008800; font-weight: bold } /* Keyword.Reserved */
          .kt { color: #888888; font-weight: bold } /* Keyword.Type */
          .m { color: #0000DD; font-weight: bold } /* Literal.Number */
          .s { color: #dd2200; background-color: #fff0f0 } /* Literal.String */
          .na { color: #336699 } /* Name.Attribute */
          .nb { color: #003388 } /* Name.Builtin */
          .nc { color: #bb0066; font-weight: bold } /* Name.Class */
          .no { color: #003366; font-weight: bold } /* Name.Constant */
          .nd { color: #555555 } /* Name.Decorator */
          .ne { color: #bb0066; font-weight: bold } /* Name.Exception */
          .nf { color: #0066bb; font-weight: bold } /* Name.Function */
          .nl { color: #336699; font-style: italic } /* Name.Label */
          .nn { color: #bb0066; font-weight: bold } /* Name.Namespace */
          .py { color: #336699; font-weight: bold } /* Name.Property */
          .nt { color: #bb0066; font-weight: bold } /* Name.Tag */
          .nv { color: #336699 } /* Name.Variable */
          .ow { color: #008800 } /* Operator.Word */
          .w { color: #bbbbbb } /* Text.Whitespace */
          .mf { color: #0000DD; font-weight: bold } /* Literal.Number.Float */
          .mh { color: #0000DD; font-weight: bold } /* Literal.Number.Hex */
          .mi { color: #0000DD; font-weight: bold } /* Literal.Number.Integer */
          .mo { color: #0000DD; font-weight: bold } /* Literal.Number.Oct */
          .sb { color: #dd2200; background-color: #fff0f0 } /* Literal.String.Backtick */
          .sc { color: #dd2200; background-color: #fff0f0 } /* Literal.String.Char */
          .sd { color: #dd2200; background-color: #fff0f0 } /* Literal.String.Doc */
          .s2 { color: #dd2200; background-color: #fff0f0 } /* Literal.String.Double */
          .se { color: #0044dd; background-color: #fff0f0 } /* Literal.String.Escape */
          .sh { color: #dd2200; background-color: #fff0f0 } /* Literal.String.Heredoc */
          .si { color: #3333bb; background-color: #fff0f0 } /* Literal.String.Interpol */
          .sx { color: #22bb22; background-color: #f0fff0 } /* Literal.String.Other */
          .sr { color: #008800; background-color: #fff0ff } /* Literal.String.Regex */
          .s1 { color: #dd2200; background-color: #fff0f0 } /* Literal.String.Single */
          .ss { color: #aa6600; background-color: #fff0f0 } /* Literal.String.Symbol */
          .bp { color: #003388 } /* Name.Builtin.Pseudo */
          .vc { color: #336699 } /* Name.Variable.Class */
          .vg { color: #dd7700 } /* Name.Variable.Global */
          .vi { color: #3333bb } /* Name.Variable.Instance */
          .il { color: #0000DD; font-weight: bold } /* Literal.Number.Integer.Long */
        css
      end
    end

    def self.registered(app)
      app.set :use_albino, proc { system 'pygmentize -V' }
      app.set :glorify_extensions, { :filter_html => true,
                                     :autolink => true,
                                     :no_intra_emphasis => true,
                                     :fenced_code_blocks => true
                                    }
      app.helpers Glorify::Helpers
      app.get '/pygments.css' do
        glorify_css
      end
    end
  end

  register Glorify
end