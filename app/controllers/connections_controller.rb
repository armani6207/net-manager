class ConnectionsController < ApplicationController

    def destroy
        @connection = Connection.find(params[:id])
        @network = @connection.network
        @connection.destroy

        redirect_to network_path(@network)
    end

end