class DevicesController < ApplicationController



def index
    @devices = Device.all

    if !params[:device_type].blank?
        @device_list = Device.by_type(params[:device_type])
    else
        @device_list = Device.all
    end
end

end