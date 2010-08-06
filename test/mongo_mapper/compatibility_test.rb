require 'test_helper'

class MongoMapperCompatibilityTest < ActiveSupport::TestCase
  test 'respects raise_on_save_failure' do
    user = new_user(:email => nil)
    assert user.invalid?
    assert_raise do
      user.save
    end

    user = new_user
    assert user.valid?
    assert user.save
  end
end
