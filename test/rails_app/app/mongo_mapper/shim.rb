module Shim
  extend ::ActiveSupport::Concern

  included do
    self.include_root_in_json = true
  end
end
