require 'shared_admin'

class Admin
  include MongoMapper::Document

  key :username, String

  timestamps!

  include SharedAdmin
  include Shim
end
