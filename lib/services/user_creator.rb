require_dependency './lib/entities/user_entity'
require_dependency './lib/repositories/user_repository'

class UserCreator < Struct.new(:listener)
  def run(request)
    user = UserEntity.new(request.to_h)

    if user.password == user.password_confirmation &&
      UserRepository.add!(user)
      listener.create_user_succeeded(user)
    else
      listener.create_user_failed(user)
    end
  end
end
