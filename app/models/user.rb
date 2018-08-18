class User < ActiveRecord::Base
  has_many :tweets

  has_secure_password
  validates :username, presence: true

  def slug
  binding.pry
    self.username.downcase.gsub(' ','-')
  end

  def self.find_by_slug(username)
    User.all.find{|user| user.slug == username}
  end
end
