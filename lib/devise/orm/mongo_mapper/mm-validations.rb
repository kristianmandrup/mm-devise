module Validatable
  # Monkey-patch Validatable::Errors to support generation of error message from
  # a Symbol. 
  class Errors                 
    class << self
      attr_accessor :default_error_messages       
      
      def default_error_message(msg, name)
        default_error_messages[name]         
      end
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
      fld_name = field_name.to_sym
      if message.kind_of?(Symbol)
        message = self.class.default_error_message(message, fld_name)
      end                    
      errors[fld_name] = [] if errors[fld_name].nil?               
      existing_msg = errors[fld_name].include?(message)
      original_add(fld_name, message) unless existing_msg
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
  :empty => " can't be empty",
  :blank => " can't be blank",
  :length_between => 'must be between  and  characters long',
  :too_long => 'is too long (maximum is  characters)',
  :too_short => 'is too short (minimum is  characters)',
  :wrong_length => '"is the wrong length (should be  characters)"',
  :taken => 'has already been taken',
  :not_a_number => 'is not a number',
  :not_an_integer => 'must be an integer',
  :greater_than => 'must be greater than ',
  :greater_than_or_equal_to => 'must be greater than or equal to ',
  :equal_to => 'must be equal to ',
  :not_equal_to => 'must not be equal to ',
  :less_than => 'must be less than ',
  :less_than_or_equal_to => 'must be less than or equal to ',
  :value_between => 'must be between  and ',
  :odd => 'must be odd',
  :even => 'must be even',
  :primitive => 'must be of type ',
  :not_found => 'not found',
  :already_confirmed => 'was already confirmed',
  :not_locked => 'was not locked'
}
