require 'spec_helper'

module Services
  prepend Repositories
  describe UserCreator do
    context '#.run' do
      subject { UserCreator.new(listener) }
      let(:listener) { double('listener') }
      let(:user_repository) { UserRepository.new }

      before(:example) do
        allow(listener).to receive(:create_user_succeeded)
        allow(listener).to receive(:create_user_failed)
      end

      it 'creates a user when a valid email is provided and the password and password confirmation match' do
        expect { subject.run user_repository, Request.new(email: 'alice@example.com', password: 'ssh_its_a_secret',
                 password_confirmation: 'ssh_its_a_secret') }.to change { user_repository.count }.from(0).to(1)
      end

      it 'notifies the listener when a user is successfully created' do
        expect(listener).to receive(:create_user_succeeded)
        subject.run(user_repository, Request.new(email: 'alice@example.com', password: 'secret',
                                                 password_confirmation: 'secret'))
      end

      it 'notifies the listener when a user creation fails' do
        expect(listener).to receive(:create_user_failed)
        subject.run(user_repository, Request.new(email: 'alice@example.com', password: 'secret',
                                                 password_confirmation: 'not_secret'))
      end
    end
  end
end
