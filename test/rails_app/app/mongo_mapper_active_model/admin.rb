require 'shared_admin'
require File.join(File.dirname(__FILE__), '../mongo_mapper/shim.rb')

class Admin
  include MongoMapper::Document

  key :username, String

  include SharedAdmin
  include Shim 
  
  validates_uniqueness_of :email, :times => 1, :key => 'anything' 
  validates_presence_of :email, :times => 1, :key => 'anything'

end
