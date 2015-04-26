require 'rails_helper'

RSpec.shared_examples 'redirects to login url' do
  it do
    subject
    expect(response).to redirect_to login_url
  end
end
