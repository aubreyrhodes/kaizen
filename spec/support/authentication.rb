def setup_mock_github_auth
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    uid: '12345',
    info: {
      nickname: 'aubreyrhodes',
      email:    'aubrey.c.rhodes@gmail.com',
      name:     'Aubrey Rhodes',
      image:    'http://example.com/test.png'
    },
    credentials: {
      token: 'test213'
    }
  })
end

def setup_mock_auth_failure
  OmniAuth.config.mock_auth[:github] = :invalid_credentials
end
