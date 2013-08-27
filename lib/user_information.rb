class UserInformation
  def initialize(auth_response)
    @hash = auth_response
  end

  def uid
    @hash[:uid]
  end

  def github_login
    @hash[:info][:nickname]
  end

  def email
    @hash[:info][:email]
  end

  def name
    @hash[:info][:name]
  end

  def image
    @hash[:info][:image]
  end

  def oauth_token
    @hash[:credentials][:token]
  end
end
