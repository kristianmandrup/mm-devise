require 'generators/devise/orm_helpers'
require 'sugar-high/file'

module MongoMapper
  module Generators
    class DeviseGenerator < Rails::Generators::NamedBase
      include Devise::Generators::OrmHelpers

      def generate_model
        invoke "mongo_mapper:model", [name] unless model_exists?
      end

      def inject_devise_content        
        inject_into_file model_path, model_contents, :after => "include MongoMapper::Document\n"
      end

      def replace_default_devise_orm        
        devise_init_file = File.join(Rails.root, 'config', 'initializers', 'devise.rb')
        File.replace_content_from devise_init_file, :where => 'orm/active_record', :with => 'orm/mongo_mapper'
      end
    end
  end
end
