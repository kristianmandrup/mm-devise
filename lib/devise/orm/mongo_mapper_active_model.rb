require 'mongo_mapper'
require 'devise/orm/mongo_mapper/compatibility'
require 'devise/orm/mongo_mapper/schema'
require 'devise/orm/mongo_mapper/date_time'

module Devise
  module Orm
    module MongoMapper
      module Hook
        def devise_modules_hook!
          extend Schema
          include ActiveModel::Validations
          include ActiveModelCompatibility
          include Compatibility
          #class << self; attr_reader :descendants; end;  

          def self.validates_uniqueness_of(*fields)
            validates_with UniquenessValidator, _merge_attributes(fields)
          end
          
          yield
          return unless Devise.apply_schema
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
        end
      end

      # http://github.com/jkaramon/mongomapper/blob/rails3/lib/mongo_mapper/plugins/validations.rb
      # ==============================================================
      #   validates_each in mongo_mapper should work just fine!
      # ==============================================================

      # class UniquenessValidator < ActiveModel::EachValidator
      #   def validate_each(target, attribute, value)
      #     resource = ::DataMapper.repository(target.repository.name) { target.model.first(attribute => value) }
      #     if resource.nil? || (target.saved? && resource.key == target.key)
      #       return true
      #     else
      #       target.errors.add(attribute, :taken)
      #       return false
      #     end
      #   end
      # end

      module ActiveModelCompatibility
        # include ActiveModel::Validations does not make save check valid?.
        # This may not be the best solution, but it seems to work. Note that
        # Compatibility is included after this module; its #save method handles
        # the :validate => false option.
        def save(*args)
          retval = valid? && super(*args)
          assert_save_successful(:save, retval)
          retval
        end
      end
    end
  end
end

MongoMapper::Document.append_extensions(Devise::Models)
MongoMapper::Document.append_extensions(Devise::Orm::MongoMapper::Hook)


# module MongoMapper
#   module Document
#     extend ::Devise::Models
#     extend ::Devise::Orm::MongoMapper::Hook
#   end
# end
