module OmniauthMocks
  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: 'facebook',
        uid: '12345',
        info: {
          name: 'okunao',
          email: 'aaaa@i.softbank.jp'
        }
      }
    )
  end
end

OmniAuth.config.test_mode = true