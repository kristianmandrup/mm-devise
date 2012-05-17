require 'shared_admin'

class Admin
  include MongoMapper::Document
  include Shim
  include SharedAdmin

  ## Database authenticatable  
  key :email, String, :null => true
  key :encrypted_password, String, :null => true
  
  ## Recoverable
  key :reset_password_token,    String
  key :reset_password_sent_at,  Time

  ## Rememberable
  key :remember_created_at,  Time

  ## Confirmable
  key :confirmation_token, String
  key :confirmed_at, Time
  key :confirmation_sent_at, Time
  key :unconfirmed_email, String

  ## Lockable
  key :locked_at, Time

  timestamps!
end
