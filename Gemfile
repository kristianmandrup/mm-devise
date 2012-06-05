source :rubygems

group :test do
  gem "test-unit",  "~> 2.0.9"
  gem "webrat",     "~> 0.7.0"
  gem "mocha",      "~> 0.9.8", :require => false
end

group :default do
  gem "rails",      "~> 3.2.0"
  gem "webrat",     "~> 0.7.0"

  gem 'mongo_mapper',           '~> 0.11.0'
  gem 'devise',                 '>= 2.1.0'
  gem 'devise-encryptable'
  gem 'bson_ext',               '>= 1.2.0'

  gem 'rake',                   '>= 0.8.7'
  gem "orm_adapter"
  #gem "oa-oauth",   '~> 0.3.0', :require => "omniauth/oauth"
  #gem "oa-openid",  '~> 0.3.0', :require => "omniauth/openid"
  gem "omniauth-openid", '~>1.0.0'
  gem "omniauth-facebook", '~>1.2.0'

  platforms :mri_18 do
    gem "SystemTimer"
  end

end

