ROOT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
$: << ROOT_DIR

require_dependency "#{ROOT_DIR}/lib/entities/user_entity"
require_dependency "#{ROOT_DIR}/lib/mappers/user_mapper"
require_dependency "#{ROOT_DIR}/lib/repositories/user_repository"

UserRepository.mapper = UserMapper
