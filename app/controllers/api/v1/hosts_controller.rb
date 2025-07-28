class Api::V1::HostsController < ApplicationController
  before_action :set_host, only: [:show, :update, :destroy]

  # GET /api/v1/hosts
  def index
    @host = Host.all
    render json: @hosts
  end

  # GET /api/v1/hosts/:name
  def show
    render json: @hosts
  end

  private

  def set_host
    @Host = Host.friendly.find(params[:id])
  end
end
