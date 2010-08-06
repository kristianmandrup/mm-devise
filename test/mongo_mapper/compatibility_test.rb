require 'test_helper'

class MongoMapperCompatibilityTest < ActiveSupport::TestCase
  test 'save only when valid' do
    user = new_user(:email => nil)
    assert user.invalid?
    user.save
    assert !user.errors.empty?

    user = new_user
    assert user.valid?
    assert user.save
  end
end
