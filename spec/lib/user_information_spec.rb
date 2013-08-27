require_relative '../../lib/user_information'

describe UserInformation do
  let(:auth_response){{
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
    }}

  subject{ described_class.new(auth_response) }

  it { expect(subject.uid).to eq(auth_response[:uid]) }
  it { expect(subject.github_login).to eq(auth_response[:info][:nickname]) }
  it { expect(subject.email).to eq(auth_response[:info][:email]) }
  it { expect(subject.name).to eq(auth_response[:info][:name]) }
  it { expect(subject.image).to eq(auth_response[:info][:image]) }
  it { expect(subject.oauth_token).to eq(auth_response[:credentials][:token]) }
end

