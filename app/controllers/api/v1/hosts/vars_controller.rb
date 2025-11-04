class Api::V1::Hosts::VarsController < ApplicationController
   before_action :set_host, only: [ :show ]

  # GET /api/v1/hosts/vars
  def index
    @state = Host.joins(:host_vars).select("hosts.name, host_vars.value as state").where(host_vars: { keyname: "state"})
    @cpu = Host.joins(:host_vars).select("host_vars.value as cpu").where(host_vars: { keyname: "cpu"})
    @memory = Host.joins(:host_vars).select("host_vars.value as memory_gb").where(host_vars: { keyname: "memory_gb"})
    @disk = Host.joins(:host_vars).select("host_vars.value as disk_db").where(host_vars: { keyname: "disk_db"})
    @host_vars = [@state, @cpu, @memory, @disk]
    render json: @host_vars
  end
    def set_host
    @host = Host.friendly.find(params[:id])
   end
end
