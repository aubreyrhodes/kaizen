require_relative '../../app/models/session'

describe Session do
  let(:auth_response){ {uid: '12345'} }
  let(:user_repository){ double }
  let(:user_registrar){ double }
  let(:user){ double }

  subject{ described_class.new(auth_response, user_repository: user_repository, user_registrar: user_registrar) }

  describe '#user' do
    context 'user already exists' do
      before do
        user_repository.stub(:for_session).with(auth_response[:uid]).and_return(user)
      end

      it 'returns the correct_user' do
        expect(subject.user).to eq(user)
      end
    end

    context 'user does not exist' do
      before do
        user_repository.stub(:for_session).with(auth_response[:uid]).and_return(nil)
        user_registrar.stub(:register).with(auth_response).and_return(user)
      end

      it 'returns the correct_user' do
        expect(subject.user).to eq(user)
      end
    end
  end
end
