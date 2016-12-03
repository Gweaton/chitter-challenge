require_relative '../app/models/user'

describe User do

    let!(:user) do
    User.create(username: 'Gweaton', email: 'george@example.com', name: 'George Eaton',
                password: 'george123')
    end

    it 'authenticates when given a valid username and password' do
      authenticated_user = User.authenticate(user.username, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.username, 'incorrect_password')).to be_nil
    end
end
