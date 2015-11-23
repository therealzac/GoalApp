class User < ActiveRecord::Base

  attr_reader :password

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_token!

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    return nil unless user && user.valid_password?(password)
    user
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def ensure_token!
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

end
