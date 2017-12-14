class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    @github.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"])
    session[:token] = @github.access_token
    redirect_to '/'
  end
end
