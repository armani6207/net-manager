class NetworksController < ApplicationController


    def new
        @network = Network.new
    end

    def create
        @network = Network.new(network_params)
        if @network.save
            redirect_to network_path(@network)
        else
            render 'new'
        end

    end

    def show
        find_network
    end

    def edit
        find_network
    end

    def add_device_form
        find_network
        @ary = @network.device_array
        render 'add_device'
    end

    def add_device
        find_network
        @device = Device.find_or_create_by(params.permit(:name, :device_type))
        @network.devices << @device

        @device.connections.find_by(network_id: @network.id).update(device_nick_name: params[:nickname])

        redirect_to network_path(@network)
    end

    private

    def network_params
        params.require(:network).permit(:name)
    end

    def find_network
        @network = Network.find(params[:id])
    end

end