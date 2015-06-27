class User
  attr_accessor :email, :password, :password_confirmation

  def initialize(options)
    self.email = options.fetch(:email)
    self.password = options.fetch(:password)
    self.password_confirmation = options.fetch(:password_confirmation)
    self
  end
end
