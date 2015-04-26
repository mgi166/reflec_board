require 'authlogic/test_case'

module AuthlogicHelper
  def login(user)
    activate_authlogic
    UserSession.create(user)
  end
end

RSpec.configure do |config|
  config.include Authlogic::TestCase, type: :controller
  config.include AuthlogicHelper, type: :controller
end
