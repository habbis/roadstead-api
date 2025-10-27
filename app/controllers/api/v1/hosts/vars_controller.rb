class Api::V1::Hosts::VarsController < ApplicationController
  # GET /api/v1/hosts/vars
  def index
    @hosts_vars = Host.joins(:host_vars)
    render json: @hosts_vars
  end
end
