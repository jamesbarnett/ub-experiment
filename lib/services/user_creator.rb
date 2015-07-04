# require_relative '../request'
# require_relative '../entities/user'
# require_relative '../repositories/user_repository'

module Services
  class UserCreator < Struct.new(:listener)
    def run(user_repository, request)
      user = Entities::User.new(request.to_h)

      if user.password == user.password_confirmation &&
        Repository.save!(user.to_h)
        listener.create_user_succeeded(user)
      else
        listener.create_user_failed(user)
      end
    end
  end
end
