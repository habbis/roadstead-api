class Api::V1::HostsController < ApplicationController
  # before_action :set_host, only: [ :show, :update, :destroy ]
  before_action :set_host, only: [ :show ]

  # GET /api/v1/hosts
  def index
    @host = Host.all
    render json: @hosts
  end

  # GET /api/v1/hosts/:name
  def show
    render json: @hosts
  end
  def create
    @host = Host.new(host_params)
    @host_id = Host.select(:id).where("name = ?", @host.name)
    @host.interfaces.new
    # puts @host.inspect
    puts @host_id.to_yaml
    # @interface_name = Interface.select("id").where("host_id = ?", @host_id)
    # put @interface_name.to_yaml
    # @vlan_name = Vlan.select(:name).where("name = ?", params[:vlan.name])
    # @vlan_name.interfaces.update.where("host_id = ?", @host_id)
    # @vlan_id = Vlan.select(:id).where(name = params[:vlan])
    #
    # @interface_id = Hosts.select(:interface_id).where(name = @host)
    # @vlan = Vlan.update(interface_id: @interface_id).where(name = vlan_params)
    #
    # @host.host_vars.new(params[:keyname])
    # @host.host_vars.new(params[:keyname])
    # @host.host_vars.new(params[:keyname])
    # if @host.save && @vlan_name.save
    if @host.save
    else
      render json: @host.errors, status: :unprocessable_entity
      render json: @vlan_name.errors, status: :unprocessable_entity
    end
    # @host.host_vars.new(params[:])
    # vlan_name = params[:name]
    # hostid = Host.select(:id).where("FQDN = '#{host}'")
    # vlanid = Vlan.select(:id).where("name = '#{vlan_name}'")
    # @vlan = Vlan.find(params[:name])

  end

  private

  #  def set_host
  #  Host.friendly.find(params[:id])
  # end

  def vlan_params
    params.require(:vlan).permit(:name)
  end

  def host_params
    # params.require(:host).permit(:name, :vlan.name, :keyname, :keyname, :keyname)
    params.require(:host).permit(:name)
  end
end
