require 'shared_user'

class User
  # extend Devise::Models
  include MongoMapper::Document

  key :username, String
  key :facebook_token, String
  timestamps!

  include SharedUser
  include Shim

  validates_uniqueness_of :email, :times => 1, :key => 'anything' 
  validates_presence_of :email, :times => 1, :key => 'anything'

  unless DEVISE_ORM == :mongo_mapper_active_model
    before_validation :update_password_confirmation

    # DM's validates_confirmation_of requires the confirmation field to be present,
    # while ActiveModel by default skips the confirmation test if the confirmation
    # value is nil. This test takes advantage of AM's behavior, so just add the
    # :password_confirmation value.
    def update_password_confirmation
      if self.password && self.password_confirmation.nil?
        self.password_confirmation = self.password
      end
    end
  end 
end
