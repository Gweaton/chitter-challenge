feature 'User signs in' do

  let!(:user) do
    User.create(name: 'George Eaton',
                username: 'Gweaton',
                email: 'george@example.com',
                password: 'george123')
    end
  scenario 'with correct credentials' do
    sign_in(username: user.username,
            password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  def sign_in(username:, password:)
    visit'/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
