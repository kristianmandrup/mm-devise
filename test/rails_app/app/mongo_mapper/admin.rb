require 'shared_admin'

class Admin
  include MongoMapper::Document

  key :username, String

  include SharedAdmin
  include Shim
end
