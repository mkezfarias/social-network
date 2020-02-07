class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  def index
    @users = User.all
  end

  def show; end

  def new
    redirect_to new_user_session_path
  end

end