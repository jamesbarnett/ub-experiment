require 'virtus'
require 'virtus/model'

class UserEntity
  include Virtus::Model

  attribute :id, Integer
  attribute :email, String
  attribute :password, String
  attribute :password_confirmation, String
  attribute :encrypted_password, String
  attribute :reset_password_token, String
  attribute :reset_password_token_sent_at, DateTime
  attribute :remember_created_at, DateTime
  attribute :sign_in_count, Integer
  attribute :current_sign_in_at, DateTime
  attribute :last_sign_in_at, DateTime
  attribute :current_sign_in_ip, String
  attribute :last_sign_in_ip, String
  attribute :created_at, DateTime
  attribute :updated_at, DateTime
end
