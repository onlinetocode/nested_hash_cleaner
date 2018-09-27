# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nested_hash_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = "nested_hash_cleaner"
  spec.version       = NestedHashCleaner::VERSION
  spec.authors       = ["Maurice Kock"]
  spec.email         = ["kock.maurice@googlemail.com"]

  spec.summary       = %q{Removes the given key and its value from a deeply nested hash}
  spec.description   = %q{Removes the key from nested hashes and from nested array of hashes}
  spec.homepage      = "http://github.com/onlinetocode/nested_hash_cleaner"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
