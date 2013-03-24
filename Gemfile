source "http://rubygems.org"

gemspec

# Allows stuff like `tilt=1.2.2 bundle install` or `tilt=master ...`.
# Used by the CI.
github = "git://github.com/%s.git"
repos  = {'sinatra' => github % "sinatra/sinatra", 'rdoc-rouge' => github % "zzak/rdoc-rouge"}

%w[sinatra rdoc-rouge].each do |lib|
  dep = case ENV[lib]
        when 'stable', nil then nil
        when /(\d+\.)+\d+/ then "~> " + ENV[lib].sub("#{lib}-", '')
        else {:git => repos[lib], :branch => dep}
        end
  gem lib, dep
end
