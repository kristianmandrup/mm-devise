# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mm-devise/version"

Gem::Specification.new do |s|
  s.name        = "mm-devise"
  s.version     = MongoMapper::Devise::VERSION
  s.date        = "2011-06-01"
  s.summary     = %Q{Support for using MongoMapper ORM with devise}
  s.description = %Q{dm-devise adds MongoMapper support to devise (http://github.com/plataformatec/devise) for authentication support for Rails}
  s.email       = "kmandrup@gmail.com"
  s.homepage    = "http://github.com/kristianmandrup/mm-devise"
  s.authors     = ["Kristian Mandrup"]
  s.files       = Dir.glob("lib/**/*") + %w(Changelog.txt mm-devise.gemspec Gemfile LICENSE Rakefile README.markdown)
  s.test_files  = Dir.glob("test/**/*")

  s.add_dependency 'mongo_mapper', '>= 0.9.0'
  s.add_dependency 'devise', '>= 1.2'
  s.add_dependency "SystemTimer", "~> 1.2" if RUBY_VERSION < "1.9"
end
