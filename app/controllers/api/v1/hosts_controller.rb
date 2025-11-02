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
    if @host.save
    else
      render json: @host.errors, status: :unprocessable_entity
    end

    id_vlan = Vlan.find_by(name: vlan_params)
    host = Host.find_by(name: @host.name)
    @interface = Interface.create(name: "eth0", host_id: host.id, vlan_id: id_vlan.id)
    @state = HostVar.create(host_id: host.id, keyname: "state", value: state_params)
    @memory = HostVar.create(host_id: host.id, keyname: "memory_gb", value: memory_params)
    @cpu = HostVar.create(host_id: host.id, keyname: "cpu", value: cpu_params)
    @disk = HostVar.create(host_id: host.id, keyname: "disk_db", value: disk_params)
    if @interface.save && @state.save && @memory.save && @cpu.save && @disk.save && @state.save
    else
      render json: @interface.errors, status: :unprocessable_entity
      render json: @state.errors, status: :unprocessable_entity
      render json: @memory.errors, status: :unprocessable_entity
      render json: @cpu.errors, status: :unprocessable_entity
      render json: @disk.errors, status: :unprocessable_entity
    end
  end

  private

  def set_host
    Host.friendly.find(params[:id])
  end

  def vlan_params
    params.require(:vlan)
  end

  def state_params
    params.require(:state)
  end

  def memory_params
    params.require(:memory_gb)
  end

  def cpu_params
    params.require(:cpu)
  end

  def disk_params
    params.require(:disk_gb)
  end

  def host_params
    # params.require(:host).permit(:name, :vlan.name, :keyname, :keyname, :keyname)
    params.require(:host).permit(:name)
  end
end
