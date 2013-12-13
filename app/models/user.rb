class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token

  before_validation :generate_session_token

  validates :email, :password_digest, :session_token, :presence => true
  validates :email, :uniqueness => true

  def generate_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def password
    @password
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def self.find_by_credentials(email, secret)
    found_user = self.find_by_email(email)

    return found_user if found_user && found_user.is_password?(secret)

    nil
  end

end
