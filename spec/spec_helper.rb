alias require_dependency require

$: << '../lib'
$: << '../lib/entities'

Dir["./lib/**/*.rb"].each { |f| require f }

# class UserMapper < Mapper
#   class_eval do
#     self.maps([[::UserEntity, double('User')]])
#   end
# end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
