require File.expand_path('../lib/ddd-associations/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.net"]
  gem.summary       = %q{DDD Associations}
  gem.description   = %q{Example code demonstrating the use of associations in pure Ruby}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ddd-associations"
  gem.require_paths = ["lib"]
  gem.version       = DDD::Associations::VERSION

  gem.add_development_dependency 'guard-minitest', '~> 0.5'
  gem.add_development_dependency 'guard-bundler', '~> 1.0'

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'

  gem.add_development_dependency 'pry'

  # for guard
  gem.add_development_dependency 'coolline', '~> 0.3'
end
