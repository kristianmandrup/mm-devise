require 'devise/orm/mongo_mapper/compatibility'
require 'devise/orm/mongo_mapper/schema'
require 'devise/orm/mongo_mapper/date_time'
require 'devise/orm/mongo_mapper/mm-validations'

module Devise
  module Orm
    module MongoMapper
      module Hook
        def devise_modules_hook!
          extend Schema
          include Compatibility
          yield
          return unless Devise.apply_schema
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
        end                
      end
    end
  end
end

MongoMapper::Document.append_extensions(Devise::Models)
MongoMapper::Document.append_extensions(Devise::Orm::MongoMapper::Hook)

