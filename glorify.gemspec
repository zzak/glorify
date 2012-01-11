# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "glorify/version"

Gem::Specification.new do |s|
  s.name        = "glorify"
  s.version     = Sinatra::Glorify::VERSION
  s.authors     = ["Zachary Scott"]
  s.email       = ["zachary@zacharyscott.net"]
  s.homepage    = "http://github.com/zzak/glorify"
  s.summary     = %q{Sinatra helper to parse markdown with syntax highlighting like the pros}
  s.description = %q{Renders via redcarpet with syntax highlighting thanks to albino. Able to use fenced code blocks like github, and includes a default pygments stylesheet.}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "redcarpet", "~> 2.0"
  s.add_runtime_dependency "albino"
  s.add_runtime_dependency "nokogiri"
end
