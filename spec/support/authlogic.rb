require 'authlogic/test_case'

module AuthlogicControllerHelper
  def login(user)
    activate_authlogic
    UserSession.create(user)
  end
end

module AuthlogicFeatureHelper
  def login(user)
    visit login_path

    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_button 'login'
  end
end

RSpec.configure do |config|
  config.include Authlogic::TestCase
  config.include AuthlogicControllerHelper, type: :controller
  config.include AuthlogicFeatureHelper,    type: :feature
end
