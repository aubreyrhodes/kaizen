class SessionsController < ApplicationController
  def create
    new_session = Session.new(UserInformation.new(oauth_response))
    current_user = new_session.user
    render nothing: true
  end

  def failure
    render nothing: true, status: :forbidden
  end

  private

  def oauth_response
    request.env['omniauth.auth']
  end
end
