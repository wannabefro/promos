module AuthenticationHelper
  def stub_bad_response(provider = :facebook)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[provider] = :invalid_credentials
  end

  def stub_auth_response(user = FactoryGirl.build(:user), provider = :facebook)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new({
      :provider => provider.to_s,
      :uid => '123545',
      :info => {
        :email => user.email,
        :name => user.username
      }
    })
  end

  def sign_in_omniauth(user, provider = :facebook)
    stub_auth_response(user, provider)
    visit "auth/#{provider.to_s}"
  end

  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Sign in'
  end
end
