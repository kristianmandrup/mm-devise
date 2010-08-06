module MongoMapper
  class ValidationUtil
    class << self
      attr_accessor :counter
  
      def inc_counter
        @counter ||= 0 
        @counter += 1
      end
    end
  end
end

module Devise
  module Orm
    module MongoMapper
      module Schema  
        include Devise::Schema

        SCHEMA_OPTIONS = {
          :null  => :required,
          :limit => :length
        }

        # Tell how to apply schema methods. This automatically maps :limit to
        # :length and :null to :required.
        def apply_devise_schema(name, type, options={})
          SCHEMA_OPTIONS.each do |old_key, new_key|
            next unless options.key?(old_key)
            if :null == old_key
              # :required is opposite of :null
              options[new_key] = !options.delete(old_key)
            else
              options[new_key] = options.delete(old_key)
            end
          end
          
          options.delete(:default) if options[:default].nil?
          
          if [:email, :encrypted_password, :password_salt].include? name            
            is_required = options.delete(:required)
            is_length = options.delete(:length)

            # puts "key #{name.inspect}, options: #{options.inspect}, required: #{is_required}"

            key name, type, options

            v_util = ::MongoMapper::ValidationUtil
            v_util.inc_counter

            if name == :email
              key = "unique_#{name}_#{v_util.counter}"     
              # puts "key: #{key}"
              validates_uniqueness_of name.to_sym, :key => key
            end
            
            if is_length
              key = "length_#{name}_#{v_util.counter}"     
              # puts "key: #{key}"
              validates_length_of name.to_sym, :key => key
            end

            if is_required                               
              key = "presence_#{name}_#{v_util.counter}"    
              # puts "key: #{key}"              
              validates_presence_of name.to_sym, :key => key
            end
          else
            key name, type, options          
          end              
        end
      end
    end
  end
end
