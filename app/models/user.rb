class User < ApplicationRecord
  has_many :markers
  # has_secure_password
end
