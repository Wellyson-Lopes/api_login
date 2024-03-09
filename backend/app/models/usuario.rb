class Usuario < ApplicationRecord
  has_secure_password :senha

  validates_uniqueness_of :email
  validates_presence_of :nome, :email, :senha_digest
end
