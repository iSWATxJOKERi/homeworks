class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    # no user with given username
    return nil if user.nil?

    # check user's password
    user.password_digest.is_password?(password) ? user : nil
  end

  def is_password?(password) {
    rp = BCrypt::Password.new(self.password_digest);
    rp.is_password?(password);
  }

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end
end