module Repositories
  class UserRepository
    attr_accessor :users
    def initialize
      self.users = []
    end

    def count
      users.size
    end

    def create user
      self.users << user
    end
  end
end
