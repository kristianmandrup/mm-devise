source :rubygems

group :test do
  gem "test-unit",  "~> 2.0.9"
  gem "webrat",     "~> 0.7.2"
  gem "mocha",      "~> 0.9.8", :require => false
end

group :default do
  gem "rails",      "~> 3.0.7"
  gem "webrat",     "~> 0.7.2"

  gem 'mongo_mapper',           '~> 0.9.0'
  gem 'devise',                 '>= 1.2.0'
  gem 'bson_ext',               '>= 1.2.0'

  gem 'rake',                   '>= 0.8.7'
  gem "orm_adapter"
  gem "oa-oauth",   '~> 0.2.0', :require => "omniauth/oauth"
  gem "oa-openid",  '~> 0.2.0', :require => "omniauth/openid"

  platforms :mri_18 do
    gem "SystemTimer"
  end

end

