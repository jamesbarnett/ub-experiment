module Services
  class UserCreator < Struct.new(:listener)
    prepend Repositories

    def run(request)
      user = Entities::User.new(request.to_h)

      if user.password == user.password_confirmation &&
        UserRepository.save!(user)
        listener.create_user_succeeded(user)
      else
        listener.create_user_failed(user)
      end
    end
  end
end
