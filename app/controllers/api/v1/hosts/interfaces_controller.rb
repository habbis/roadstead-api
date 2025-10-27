class Api::V1::Hosts::InterfacesController < ApplicationController
  # GET /api/v1/hosts/interfaces
  def index
    @hosts_interface = Host.joins(:interface)
    render json: @hosts_interface
  end
end
