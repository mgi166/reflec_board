require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  describe '/login' do
    before do
      create(:user)
    end

    describe 'given currect username' do
      before do
        visit login_path

        fill_in :username, with: 'test'
        fill_in :password, with: 'password'
        click_button 'login'
      end

      it do
        expect(page).to have_selector('div.alert-success')
      end

      it do
        expect(page).to have_content I18n.t('views.shared.header.logout')
      end

      it do
        expect(page).to have_content I18n.t('views.shared.header.account_setting')
      end

      it 'redirects to musics_path' do
        expect(current_path).to eq musics_path
      end
    end

    describe 'given bad username' do
      before do
        visit login_path

        fill_in :username, with: 'bad-user'
        fill_in :password, with: 'password'
        click_button 'login'
      end

      it do
        expect(page).to have_selector('div.alert-danger')
      end

      it do
        expect(page).to have_content I18n.t('views.shared.header.login')
      end

      it do
        expect(page).to have_content I18n.t('views.shared.header.signup')
      end

      it 'redirects to login_url' do
        expect(current_path).to eq login_path
      end
    end
  end
end
