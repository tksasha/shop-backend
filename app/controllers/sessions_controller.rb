class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  after_action :login_user, only: :create

  after_action :logout_user, only: :destroy

  private
  def resource
    @resource ||= Session.new
  end

  def resource_params
    params.require(:session).permit(:email, :password)
  end

  def login_user
    session[:auth_token] = resource.auth_token if resource.persisted?
  end

  def logout_user
    session[:auth_token] = nil if resource.destroyed?
  end

  def create_success_callback
    respond_to do |format|
      format.html { redirect_to :profile }

      format.json { render }
    end
  end

  def destroy_callback
    redirect_to [:new, :session]
  end
end
