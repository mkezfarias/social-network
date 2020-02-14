module OmniauthMacros
  def facebook_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      'provider' => 'facebook',
      'uid' => '12345',
      'info' => {
        'email' => 'miguel@miguel.com',
        'name' => 'miguel farias'
      }
    )
  end
end
