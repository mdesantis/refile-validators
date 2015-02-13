lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'refile/validators/version'

Gem::Specification.new do |spec|
  spec.name          = 'refile-validators'
  spec.version       = Refile::Validators::VERSION
  spec.authors       = ['Maurizio De Santis']
  spec.email         = ['desantis.maurizio@gmail.com']
  spec.summary       = 'Collection of validators for Refile'
  spec.homepage      = 'https://github.com/mdesantis/refile-validators'
  spec.license       = 'MIT'

  spec.files        = Dir['README.md', 'LICENSE.txt', 'lib/**/*']
  spec.test_files   = Dir['spec/**/*']
  spec.require_path = 'lib'

  spec.required_ruby_version = '>= 2.1.0'

  spec.add_dependency 'activemodel', '~> 4.1'
  spec.add_dependency 'activesupport', '~> 4.1'
  spec.add_dependency 'mime-types'
  spec.add_dependency 'refile', '~> 0.5'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'redcarpet'
end
