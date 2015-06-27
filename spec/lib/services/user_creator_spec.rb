require 'spec_helper'

describe UserCreator do
  context '#.run' do
    let(:user_repository) { UserRepository.new }

    it 'creates a user when a valid email is provided and the password and password confirmation match' do
      expect { UserCreator.run user_repository, Request.new(email: 'alice@example.com', password: 'ssh_its_a_secret',
               password_confirmation: 'ssh_its_a_secret') }.to change { user_repository.count }.from(0).to(1)
    end
  end
end
