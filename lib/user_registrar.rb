class UserRegistrar
  def initialize(user_repository: User)
    @user_repository = user_repository
  end

  def self.register(user_information)
    new.register(user_information)
  end

  def register(user_information)
    @user_repository.create!(
      user_attributes(user_information)
    )
  end

  private

  def user_attributes(user_information)
    {}.tap do |attrs|
      [:name, :github_login, :email, :image, :oauth_token].each do |key|
        attrs[key] = user_information.send(key)
      end
    end
  end
end
