# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "glorify/version"

Gem::Specification.new do |s|
  s.name        = "glorify"
  s.version     = Sinatra::Glorify::VERSION
  s.authors     = ["Zachary Scott", "Jonathan Stott", "Simon Gate"]
  s.email       = ["zachary@zacharyscott.net"]
  s.homepage    = "http://zacharyscott.net/glorify/"
  s.summary     = %q{Sinatra helper to parse markdown with syntax highlighting like the pros}
  s.description = %q{Renders markdown via rdoc-rouge, an RDoc and Rouge bridge. Able to use fenced code blocks like github, and includes a default pygments stylesheet.}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "rdoc-rouge"
  s.add_runtime_dependency "nokogiri"

  s.add_development_dependency "minitest"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "rake"
  s.add_development_dependency "w3c_validators"
  s.add_development_dependency "rdoc", "4.0.0"
end
