class BlocksController < ApplicationController
  include Rest

  include Authorization

  private
  def resource_params
    params[:user_id]
  end

  def destroy_callback
    respond_to do |format|
      format.html { head :no_content }

      format.json { head :no_content }

      format.js { render }
    end
  end

  def resource
    @resource ||= build_resource
  end
end
