require File.expand_path('../lib/ddd-associations/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.net"]
  gem.summary       = %q{DDD Associations}
  gem.description   = %q{Associations in pure Ruby, inspired by domain-driven design.}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ddd-associations"
  gem.require_paths = ["lib"]
  gem.version       = DDD::Associations::VERSION

  gem.add_dependency 'activesupport', '~> 3.2'
  gem.add_development_dependency 'rake'
end
