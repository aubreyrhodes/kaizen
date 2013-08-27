require_relative '../../lib/user_registrar'

describe UserRegistrar do
  let(:user_repository){ double }

  subject{ described_class.new(user_repository: user_repository) }

  describe '#register' do
    let(:user_attributes) { {
      name: 'Aubrey Rhodes',
      github_login: 'aubreyrhodes',
      email: 'aubrey.c.rhodes@gmail.com',
      image: 'http://test.com/test.png',
      oauth_token: 'abc123'
    }}
    let(:user_information) { double(user_attributes) }

    it 'creates a new user' do
      user_repository.should_receive(:create!)
        .with(user_attributes)
      subject.register(user_information)
    end
  end
end
