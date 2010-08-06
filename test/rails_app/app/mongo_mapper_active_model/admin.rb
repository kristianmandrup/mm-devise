require 'shared_admin'
require File.join(File.dirname(__FILE__), '../mongo_mapper/shim.rb')

class Admin
  include MongoMapper::Document

  key :username, String
  timestamps!

  include SharedAdmin
  include Shim 
  
end
