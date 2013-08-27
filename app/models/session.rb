class Session
  def initialize(user_information,
                 user_repository: User,
                 user_registrar: UserRegistrar)
    @user_repository = user_repository
    @user_information = user_information
    @user_registrar = user_registrar
  end

  def user
    @user_repository.for_session(@user_information) ||
      @user_registrar.register(@user_information)
  end
end
