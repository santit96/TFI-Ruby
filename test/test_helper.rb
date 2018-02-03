require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
 
end

module ActionDispatch
  class ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end

module ActionController
  class ActionController::TestCase
    include Devise::Test::ControllerHelpers
  end
end
