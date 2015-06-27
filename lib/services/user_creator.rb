require_relative '../request'
require_relative '../entities/user'
require_relative '../repositories/user_repository'

class UserCreator
  def self.run(user_repository, request)
    user_repository.save(User.new(email: request.email, password: request.password,
                                  password_confirmation: request.password_confirmation))
  end
end
