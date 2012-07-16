require File.expand_path('../lib/ddd-aggregates/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.net"]
  gem.summary       = %q{DDD Aggregates}
  gem.description   = %q{Esxample code demonstrating the use of aggregates in DDD}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ddd-aggregates"
  gem.require_paths = ["lib"]
  gem.version       = DDD::Aggregates::VERSION

  gem.add_development_dependency 'guard-minitest', '~> 0.5'
  gem.add_development_dependency 'guard-bundler', '~> 1.0'

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'

  gem.add_development_dependency 'pry'

  # for guard
  gem.add_development_dependency 'coolline', '~> 0.3'
end
