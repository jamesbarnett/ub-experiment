require 'spec_helper'

describe UserCreator do
  context '#.run' do
    subject { UserCreator.new(listener) }
    let(:listener) { double('listener') }

    before(:example) do
      allow(UserRepository).to receive(:save!) { true }
    end

    it 'notifies the listener when a user is successfully created' do
      expect(listener).to receive(:create_user_succeeded)
      subject.run(Request.new(email: 'alice@example.com', password: 'secret',
                              password_confirmation: 'secret'))
    end

    it 'notifies the listener when a user creation fails' do
      expect(listener).to receive(:create_user_failed)
      subject.run(Request.new(email: 'alice@example.com', password: 'secret',
                              password_confirmation: 'not_secret'))
    end
  end
end
