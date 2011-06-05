# MongoMapper for Devise

`mm-devise` will let you use [devise](http://github.com/plataformatec/devise) with [MongoMapper](http://github.com/jnunemaker/mongomapper).

`mm-devise` is intended for use with `Rails 3+` and `Devise 1.2` and above. It may work with earlier versions of devise.

This README only covers `mm-devise` specifics. Make sure to read the [devise README](http://github.com/plataformatec/devise/blob/master/README.rdoc)

## Status update, June 2011

Recently upgraded to (hopefully!) support Devise > 1.2 and MongoMapper 0.9.0.

## Installation

Add `devise`, `mm-devise` and `mongo_mapper` gems to your Gemfile (your Rails app Gemfile).

    gem 'mongo_mapper',           '~> 0.9.0'
    # You'll want this to for better mongo driver performance
    gem 'bson_ext'

    gem 'devise',                 '~> 1.3.4'
    gem 'mm-devise',              '~> 1.2.0'

Use bundler to install all required gems in your Rails 3 app

    bundle install

Run the devise install generator, followed by the mm-devise model generator:

    rails generate devise:install
    rails generate mongo_mapper:devise MODEL

The devise install generator will install an initializer
(`config/inititializer/devise.rb`) which describes ALL Devise's configuration
options and you MUST take a look at it. Maker sure this line exists:

    require 'devise/orm/mongo_mapper'

NOTE: The model generator should do this automatically.

To add Devise to any of your models using the generator:

    rails generate mongo_mapper:devise MODEL

Example: create a User model for use with Devise

    rails generate mongo_mapper:devise User

Read the README for devise at [devise README](http://github.com/plataformatec/devise/blob/master/README.rdoc)

## Test Driven Development - extending this project

To develop on this project using TDD, requires the following setup.
Clone this project into a container folder, fx <code>/projects</code>, so you have fx <code>/projects/mm-devise</code>
In the same container folder clone <code>devise</code> from github

Example:

<pre>git clone http://github.com/kristianmandrup/mm-devise.git
git clone http://github.com/plataformatec/devise.git
cd mm-devise
bundle install
rake test</pre>

## Gem install

<pre>$ rake install</pre>

## Gem release (push to RubyGems)

<pre>$ gem push pkg/mm-devis-xxxx.gem</pre>

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Maintainers

*Kristian Mandrup*

## Contributors

*bmarini* - Updated to support MongoMapper 0.9 (June 2011)
*bhbryant* - Fixed some issues and updated gem (Jan 2011)
*Jared Morgan* - Created the dm-devise gem which was used as a template for the development of this gem.
Also made suggestions for a few critical fixes and improvements in the code. Thanks :)

## Bugs and Feedback

For *mm-devise* specific issues, please create an issue on GitHub at: [mm-devise issues](http://github.com/kristianmandrup/mm-devise/issues)

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.


