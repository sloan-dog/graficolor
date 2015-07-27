class User < ActiveRecord::Base

  has_secure_password

  has_many :palettes

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: {with: /@/}

  # def self.authenticate email, password
  #   User.find_by_email(email).try(:authenticate, password)
  # end

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
