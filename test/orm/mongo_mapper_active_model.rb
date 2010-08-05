require 'rails/test_help'

class ActiveSupport::TestCase
  setup do
    User.all.destroy!
    Admin.all.destroy!
  end
end
