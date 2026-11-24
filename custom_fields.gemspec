#!/usr/bin/env gem build
# frozen_string_literal: true

require_relative 'lib/custom_fields/version'

# standard name/version form so Dependabot can evaluate the gemspec without lib/
Gem::Specification.new do |spec|
  spec.name        = 'custom_fields'
  spec.version     = CustomFields::VERSION
  spec.summary     = 'Custom fields extension for Mongoid.'
  spec.description = 'Manage custom fields to a Mongoid document or a collection. This module is one of the core features we implemented in our custom CMS, named LocomotiveCMS.'
  spec.author      = 'Didier Lafforgue'
  spec.email       = 'didier@nocoffee.fr'
  spec.homepage    = 'https://github.com/locomotivecms/custom_fields'
  spec.license     = 'MIT'

  spec.files = Dir[
    'MIT-LICENSE',
    'README.md',
    '{lib}/**/*',
    '{config}/**/*'
  ]

  spec.extra_rdoc_files = [
    'MIT-LICENSE',
    'README.md'
  ]

  spec.required_ruby_version = '>= 3.3'

  spec.add_dependency 'activesupport',       '>= 7.1', '< 9'
  spec.add_dependency 'bcrypt',              '~> 3.1'
  spec.add_dependency 'carrierwave',         '~> 3.1'
  spec.add_dependency 'carrierwave-mongoid', '~> 1.6'
  spec.add_dependency 'monetize',            '>= 1.12', '< 3'
  spec.add_dependency 'mongoid',             '>= 8', '< 10'
end
