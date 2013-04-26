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



  def self.authenticate(g_un, g_pw)
    user = User.find_by_user_name(g_un)
    return nil unless user
    if user.password == g_pw
      # give token TODO
      return user
    else
      return nil
    end
  end

end
