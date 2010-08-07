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
          required_option = options.delete(:required)          
          length_option = options.delete(:length)          

          type = Time if type == DateTime         

          key name, type, options
          
          counter = ::MongoMapper::ValidationUtil.inc_counter
        
          handle_email(name, counter) if name == :email          
          handle_length(name, counter, length_option) if length_option
          handle_required(name, counter) if required_option                               
        end  
        
        protected

        def make_key prefix, name, counter
          "#{prefix}_#{name}_#{counter}"
        end

        def handle_required name, counter          
          key = make_key :presence, name, counter 
          validates_presence_of name.to_sym, :key => key
        end

        def handle_email name, counter            
          key = make_key :unique, name, counter
          validates_uniqueness_of name.to_sym, :key => key
        end

        def handle_length name, counter, length_option
          key = make_key :length, name, counter
          options = case length_option
          when Fixnum
            {:maximum => length_option}
          when Hash
            length_option
          else
            raise ArgumentError, "length validation option must be either a Fixnum or Hash"                                
          end            
          options[:key] = key            
          
          validates_length_of name.to_sym, options
        end        
      end
    end
  end
end
