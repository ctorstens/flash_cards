class User < ActiveRecord::Base
  has_many :rounds

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :password_hash, :presence => true
end
