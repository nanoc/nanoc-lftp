# encoding: utf-8

$LOAD_PATH.unshift(File.expand_path('../lib/', __FILE__))
require 'nanoc/lftp/version'

Gem::Specification.new do |s|
  s.name        = 'nanoc-lftp'
  s.version     = Nanoc::LFTP::VERSION
  s.homepage    = 'http://nanoc.ws/'
  s.summary     = 'LFTP deployer for nanoc'
  s.description = 'Provides an :lftp deployer for nanoc'

  s.author  = 'Denis Defreyne'
  s.email   = 'denis.defreyne@stoneship.org'
  s.license = 'MIT'

  s.required_ruby_version = '>= 1.9.3'

  s.files              = Dir['[A-Z]*'] +
                         Dir['{lib,test}/**/*'] +
                         [ 'nanoc-lftp.gemspec' ]
  s.require_paths      = [ 'lib' ]

  s.rdoc_options     = [ '--main', 'README.md' ]
  s.extra_rdoc_files = [ 'LICENSE', 'README.md', 'NEWS.md' ]

  s.add_runtime_dependency('nanoc', '>= 3.6.7', '< 4.0.0')
  s.add_development_dependency('systemu', '~> 2.6')
  s.add_development_dependency('bundler', '~> 1.5')
end
