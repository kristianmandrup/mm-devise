require 'validatable'

module Validatable
  # Monkey-patch Validatable::Errors to support generation of error message from
  # a Symbol. 
  class Errors                 
    @@default_error_messages = {}

    # Holds a hash with all the default error messages that can be replaced by your own copy or localizations.
    def self.default_error_messages=(default_error_messages)
      @@default_error_messages = default_error_messages
    end

    def self.default_error_message(key, field, *values)
      field = field.to_s.humanize
      @@default_error_messages[key] % [field, *values].flatten
    end
      
    # original add before monkey-patch
    # def add(attribute, message) #:nodoc:
    #   errors[attribute.to_sym] = [] if errors[attribute.to_sym].nil?
    #   errors[attribute.to_sym] << message
    # end

    alias_method :original_add, :add
    
    # If the message is a Symbol, allow +default_error_message+ to generate
    # the message, including translation.
    def add(field_name, message)      
      if message.kind_of?(Symbol)
        message = self.class.default_error_message(message, field_name)
      end                    
      fld_name = field_name.to_sym
      errors[fld_name] = [] if errors[fld_name].nil?
      original_add(fld_name, message) unless errors[fld_name].include?(message)
    end        
  end
end

module Validatable 
  class ValidatesPresenceOf < ValidationBase #:nodoc:
    def message(instance)
      super || "can't be blank"
    end
  end
end

module Validatable
  class ValidatesLengthOf < ValidationBase #:nodoc:    
    def message(instance)
      min = !within.nil? ? within.first : minimum
      max = !within.nil? ? within.last : maximum
      super || "must be between #{min} and #{max} characters long"
    end
  end
end


# Default error messages consistent with ActiveModel messages and devise
# expectations.
Validatable::Errors.default_error_messages = {
  :absent => 'must be absent',
  :inclusion => 'is not included in the list',
  :exclusion => 'is reserved',
  :invalid => 'is invalid',
  :confirmation => " doesn't match confirmation",
  :accepted => 'must be accepted',
  :nil => 'must not be nil',
  :empty => "can't be empty",
  :blank => "can't be blank",
  :length_between => 'must be between %s and %s characters long',
  :too_long => 'is too long (maximum is %s characters)',
  :too_short => 'is too short (minimum is %s characters)',
  :wrong_length => 'is the wrong length (should be %s characters)',
  :taken => 'has already been taken',
  :not_a_number => 'is not a number',
  :not_an_integer => 'must be an integer',
  :greater_than => 'must be greater than %s',
  :greater_than_or_equal_to => 'must be greater than or equal to ',
  :equal_to => 'must be equal to %s',
  :not_equal_to => 'must not be equal to %s',
  :less_than => 'must be less than %s',
  :less_than_or_equal_to => 'must be less than or equal to %s',
  :value_between => 'must be between %s and %s',
  :odd => 'must be odd',
  :even => 'must be even',
  :primitive => 'must be of type %s',
  :not_found => 'not found',
  :already_confirmed => 'was already confirmed',
  :not_locked => 'was not locked'  
}
