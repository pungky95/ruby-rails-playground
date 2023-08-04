require "uuidtools"
require "argon2"

class User < ApplicationRecord
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :password,
            presence: true,
            confirmation: true,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  before_save :hash_password

  def as_json(options = {})
    super(options.merge({ except: [:password] }))
  end

  def check_password(password)
    Argon2::Password.verify_password(password, self.password)
  end

  private

  def hash_password
    self.password = Argon2::Password.create(self.password).to_s
  end
end
