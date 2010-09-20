# MongoMapper for Devise

*mm-devise* will let you use [devise](http://github.com/plataformatec/devise) with [MongoMapper](http://github.com/jnunemaker/mongomapper). 

*mm-devise* is intended for use with *Rails 3* and *Devise 1.1.1*. It may work with earlier versions of devise, but it's not been tested.

This README only covers *mm-devise* specifics. Make sure to read the [devise README](http://github.com/plataformatec/devise/blob/master/README.rdoc)

## Usage options

The gem gives you the options of 2 ORM setups depending on what library you wish to use for validations:   

* *mongo_mapper* - Uses MongoMapper validations 
* *mongo_mapper_active_model* - Uses ActiveModel::Validations

The advantage to this is ActiveModel's I18n support for error messages, and it uses the same validations lib as devise does by default.

## ActiveModel compatibility 

Currently only the <code>mongo_mapper</code> option has been tested. 
There should be full ActiveModel support in a future version of MongoMapper, after Rails 3 is released.
ActiveModel support will likely be part of *MongoMapper 1.0* (as mentioned by jnunemaker in a post).

## Installation

Add *devise*, *mm-devise* and *MongoMapper* gems to your Gemfile (your Rails app Gemfile). The following gems are required

<pre>  gem 'mongo_mapper',           '>= 0.8.2'
  gem 'jnunemaker-validatable', '>= 1.8.4'
  gem 'bson_ext',               '>= 1.0.4'
  gem 'devise',                 '~> 1.1.1'
  gem 'mm-devise',              '>= 1.1.0'
  gem 'rails3-generators',      '>= 0.12.1' # optional</pre>

You can install [rails3-generators](http://github.com/indirect/rails3-generators) which includes a *mongo_mapper* Model generator

<pre>gem install rails3-generators</pre>
  
Alternatively use bundler to install all required gems in your Rails 3 app 

<pre>bundle install</pre>

Run the generator:

<pre>rails generate devise:install</pre>

The generator will install an initializer which describes ALL Devise's
configuration options and you MUST take a look at it. Make sure to specify
either <code>mongo_mapper</code> or <code>mongo_mapper_active_model</code> (ActiveModel::Validations) 
as the orm in the configuration file.

  require 'devise/orm/mongo_mapper'

Note: The model generator should do this automatically.

To add Devise to any of your models using the generator:

<pre>rails generate mongo_mapper:devise MODEL</pre>  

Example: create a User model for use with Devise  

<pre>rails generate mongo_mapper:devise User</pre>

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

When you run <code>rake test</code>, you will (as of Aug 6, 2010) still get a few errors and failures.
This is NOT due to any errors in <code>mm-devise</code> but rather due to a few "issues" with a few of the devise tests themselves IMO. 

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

*Jared Morgan* - Created the dm-devise gem which was used as a template for the development of this gem.
Also made suggestions for a few critical fixes and improvements in the code. Thanks :)

## Bugs and Feedback

For *mm-devise* specific issues, please create an issue on GitHub at: [mm-devise issues](http://github.com/kristianmandrup/mm-devise/issues)

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.


