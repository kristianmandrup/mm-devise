require 'generators/devise/orm_helpers'

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
    end
  end
end
