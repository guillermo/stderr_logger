# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stderr_logger/version'

Gem::Specification.new do |gem|
  gem.name          = "stderr_logger"
  gem.version       = StderrLogger::VERSION
  gem.authors       = ["Guillermo A\314\201lvarez"]
  gem.email         = ["guillermo@cientifico.net"]
  gem.description   = %q{Simple logger that add info debug and error to Object and always output to STDERR}
  gem.summary       = %q{Simple logger}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "colored"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "delorean"
end
