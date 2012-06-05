require 'shared_user'

class User
  include MongoMapper::Document
  include Shim
  include SharedUser

  key :username, String
  key :facebook_token, String

  ## Database authenticatable
  key :email, String, :null => false, :default => ""
  key :encrypted_password, String, :null => false, :default => ""

  ## Recoverable
  key :reset_password_token,    String
  key :reset_password_sent_at,  Time

  ## Rememberable
  key :remember_created_at,  Time

  ## Trackable
  key :sign_in_count, Integer, :default => 0
  key :current_sign_in_at, Time
  key :last_sign_in_at,     Time
  key :current_sign_in_ip,  String
  key :last_sign_in_ip,     String

  ## Confirmable
  key :confirmation_token, String
  key :confirmed_at, Time
  key :confirmation_sent_at, Time

  ## Lockable
  key :failed_attempts, Integer, :default => 0
  key :locked_at, Time
  key :unlock_token, String

  ## Token authenticatable
  key :authentication_token, String

  timestamps!
end
