# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "under_rack/version"

Gem::Specification.new do |s|
  s.name        = "under_rack"
  s.version     = UnderRack::VERSION
  s.authors     = ["Rinaldi Fonseca"]
  s.email       = ["rinaldifonseca@gmail.com"]
  s.homepage    = "http://www.github.com/rinaldifonseca/under_rack"
  s.summary     = %q{UnderRack is a Ruby Framework for you understand Rack}
  s.description = %q{UnderRack is a Ruby Framework for you understand Rack}

  s.rubyforge_project = "under_rack"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_runtime_dependency "rack", "1.4.1"
end
