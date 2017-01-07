# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubygems/code_finder/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubygems-code_finder'
  spec.version       = Rubygems::CodeFinder::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']
  spec.summary       = %q{Easy to find rubygems' github repository.}
  spec.description   = %q{Find repos from api.rubygems.org response, gem spec, github search, etc.}
  spec.homepage      = 'https://github.com/sanemat/rubygems-code_finder'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'multi_json'
  spec.add_dependency 'octokit'

  spec.add_development_dependency 'bundler', '>= 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3'
  spec.add_development_dependency 'webmock'
end
