# -*- encoding: utf-8 -*-
require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Will Jessop']
  gem.email         = ['wjessop@gmail.com']
  gem.description   = 'Helpers for RubyMotion'
  gem.summary       = 'Helpers for RubyMotion'
  gem.homepage      = 'http://github.com/spnkr/motion-gravity'

  gem.files         = `git ls-files`.split($\)
  # gem.test_files    = gem.files.grep(%r{^(test|spec|lib_spec|features)/})
  gem.name          = 'motion-gravity'
  gem.require_paths = ['lib']
  gem.version       = MotionGravity::Version

  gem.add_dependency 'bubble-wrap' #, '1.7.1'
  gem.add_dependency 'sugarcube' #, '3.0.5'
end
