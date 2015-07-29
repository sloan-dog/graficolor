class User < ActiveRecord::Base

  has_secure_password


  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: {with: /@/}

  has_many :palettes

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

  def display_name
    self.name || 'Morgan Freeman'
  end

end
