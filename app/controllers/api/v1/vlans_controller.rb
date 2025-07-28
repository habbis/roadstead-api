module Api
  module V1
    class VlansController < ApplicationController
      before_action :set_vlan, only: [:show, :update, :destroy]

      # GET /api/v1/vlans
      def index
        @vlans = Vlan.all
        render json: @vlans
      end

      # GET /api/v1/vlans/:name
      def show
        render json: @vlan
      end

      # POST /api/v1/vlans
      def create
        @vlan = Vlan.new(vlan_params)
        if @vlan.save
          render json: @vlan, status: :created
        else
          render json: @vlan.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/vlans/:name
      def update
        if @vlan.update(vlan_params)
          render json: @vlan
        else
          render json: @vlan.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/vlans/:name
      def destroy
        @vlan.destroy
        head :no_content
      end

      private

      def set_vlan
        @vlan = Vlan.friendly.find(params[:id])
      end

      def vlan_params
        params.require(:vlan).permit(:name, :vlan_id, :prefix)
      end
    end
  end
end
