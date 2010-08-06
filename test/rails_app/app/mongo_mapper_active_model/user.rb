require 'shared_user'
require File.join(File.dirname(__FILE__), '../mongo_mapper/shim.rb')

class User
  include MongoMapper::Document

  key :username, String
  key :facebook_token, String
  timestamps!

  include SharedUser
  include Shim     
  
  validates_uniqueness_of :email, :times => 1, :key => 'anything' 
  validates_presence_of :email, :times => 1, :key => 'anything'

end
