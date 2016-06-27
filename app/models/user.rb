class User < ActiveRecord::Base

  validates :username, :email, :hashed_password, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(given_email, given_password)
    # if email returns a user
    if user = self.find_by(email: given_email)
      if user.password == given_password
        return user
      end
    end
  end

end