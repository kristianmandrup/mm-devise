require 'shared_admin'

class Admin    
  # extend Devise::Models  
  include MongoMapper::Document

  key :username, String

  include SharedAdmin
  include Shim   
  
  validates_uniqueness_of :email, :times => 1, :key => 'anything' 
  validates_presence_of :email, :times => 1, :key => 'anything'
end
