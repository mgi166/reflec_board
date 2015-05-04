require 'authlogic/test_case'

module AuthlogicHelper
  def login(user)
    activate_authlogic
    UserSession.create(user)
  end
end

RSpec.configure do |config|

  # FIXME: I hope that config specifies multiple types at once
  #
  [:controller, :feature].each do |type|
    config.include Authlogic::TestCase, type: type
    config.include AuthlogicHelper,     type: type
  end
end
