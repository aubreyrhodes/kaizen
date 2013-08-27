class User < ActiveRecord::Base
  def self.for_session(user_information)
    find_by(github_login: user_information.github_login)
  end
end
