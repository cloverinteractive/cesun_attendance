ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha'

class ActiveSupport::TestCase
end

class ActionController::TestCase
  include Devise::TestHelpers

  def sign_in_with_role( user, role )
    user.has_role! role
    sign_in user
  end
end