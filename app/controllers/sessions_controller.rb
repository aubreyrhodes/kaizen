class SessionsController < ApplicationController
  def create
    render nothing: true
  end

  def failure
    render nothing: true, status: :forbidden
  end
end
