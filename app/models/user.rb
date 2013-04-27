class User < ActiveRecord::Base
  has_many :rounds

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :password_hash, :presence => true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(g_email, g_pw)
    user = User.find_by_email(g_email)
    return nil unless user
    if user.password == g_pw
      user.create_token
    else
      return nil
    end
  end

  def create_token
    token = Digest::MD5.hexdigest(self.email + Time.now.to_s + "kjsd94*asdHH*&h80fh")
    p token
  end

end
