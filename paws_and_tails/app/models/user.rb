class User < ApplicationRecord

  has_secure_password

  validates_uniqueness_of :user_name

  def self.get_user_name(id)
    User.find_by_id(id)[:user_name]
  end

end
