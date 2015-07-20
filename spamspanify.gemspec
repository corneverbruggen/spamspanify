# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spamspanify/version'

Gem::Specification.new do |gem|
  gem.name          = "spamspanify"
  gem.version       = Spamspanify::VERSION
  gem.authors       = ["Corné Verbruggen"]
  gem.email         = ["info@corneverbruggen.com"]
  gem.description   = %q{
    Spamspanify extends the String class with a spamspanify method that
    replaces all email addresses in a string with HTML markup that can be
    handled by the SpamSpan javascript library.
  }
  gem.summary       = "Transforms email addresses in a string into SpamSpam markup"
  gem.homepage      = "https://github.com/corneverbruggen/spamspanify"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 2.12"
  gem.add_development_dependency "yard", "~> 0.8.3"
end
