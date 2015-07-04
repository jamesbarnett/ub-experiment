require 'repository'

module Repositories
  class UserRepository < ::Repository
    class_eval do
      self.mapper = Mappers::UserMapper
    end
  end
end
