require 'rails_helper'

RSpec.describe UsersController, type: :feature do
  describe 'GET users/:id' do
    let(:user) { create :user }

    # FIXME: test unfinished

    it do
      visit user_path(user)
      fill_in :name_or_email, with: 'test'
      fill_in :password, with: 'password'
      click_button 'login'

      expect(page).to have_title('')
    end
  end
end
