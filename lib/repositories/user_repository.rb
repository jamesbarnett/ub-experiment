require_dependency 'repository'

class UserRepository < Repository
  class << self
    def add!(domain)
      mapper.export_class.create!({ email: domain.email, password: domain.password, password_confirmation: domain.password_confirmation })
    end
  end
end
