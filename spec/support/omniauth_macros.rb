module OmniauthMacros
  OmniAuth.config.test_mode = true

  def facebook_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      'provider' => 'facebook',
      'uid' => '123545',
      'info' => {
        'email' => 'miguel@miguel.com',
        'name' => 'miguel farias'
      }
    )
  end
end
