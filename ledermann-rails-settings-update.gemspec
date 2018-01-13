# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'ledermann-rails-settings-update', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'ledermann-rails-settings-update'
    gem.version               = LedermannRailsSettingsUpdate::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Simplifying updating settings from controllers'
    gem.description           = 'Simplifying updating settings from controllers.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/jonhue/ledermann-rails-settings-update'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*']
    gem.require_paths         = ['lib']

    gem.required_ruby_version = '>= 2.3'

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'actionpack', '>= 5.0'
    gem.add_dependency 'activesupport', '>= 5.0'
    gem.add_dependency 'ledermann-rails-settings', '~> 2.4'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
