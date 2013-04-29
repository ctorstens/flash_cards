class User < ActiveRecord::Base
  has_many :rounds

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password_hash, :presence => true

  before_save :initial_token

  def name
    "#{first_name} #{last_name}"
  end

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(g_email, g_pw)
    @user = User.find_by_email(g_email)
    return nil unless @user
    if @user.password == g_pw
      @user
    else
      nil
    end
  end

  def initial_token
    the_seed = self.password_hash + Time.now.to_s + "kjsd94*asdHH*&h80fh"
    self.token = Digest::MD5.hexdigest(the_seed)
  end

end
