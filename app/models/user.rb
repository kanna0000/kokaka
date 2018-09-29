class User < ApplicationRecord
  authenticates_with_sorcery!
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

end
