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

          type = Time if type == DateTime
          
          is_required = options.delete(:required)
          is_length = options.delete(:length)

          # puts "key #{name.inspect}, options: #{options.inspect}, required: #{is_required}"

          key name, type, options

          v_util = ::MongoMapper::ValidationUtil
          v_util.inc_counter

          if name == :email
            key = "unique_#{name}_#{v_util.counter}"     
            validates_uniqueness_of name.to_sym, :key => key
          end
          
          if is_length
            key = "length_#{name}_#{v_util.counter}"     
            options = case is_length
            when Fixnum
              {:maximum => is_length}
            when Hash
              is_length
            else
              raise ArgumentError, "length validation option must be either a Fixnum or Hash"                                
            end            
            options[:key] = key            
            validates_length_of name.to_sym, options
          end

          if is_required                               
            key = "presence_#{name}_#{v_util.counter}"
            validates_presence_of name.to_sym, :key => key
          end
        end
      end
    end
  end
end
