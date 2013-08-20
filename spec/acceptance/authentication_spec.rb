require 'spec_helper'

describe 'authentication' do
  context 'the user has a valid github account' do
    before do
      setup_mock_github_auth
    end

    it 'allows the user to visit the root path' do
      visit '/'
      expect(page.status_code).to eq(200)
    end
  end

  context 'the user does not have a valid github account' do
    before do
      setup_mock_auth_failure
    end

    it 'does not allow the user into the system' do
      visit '/'
      expect(page.status_code).to eq(403)
    end
  end
end
