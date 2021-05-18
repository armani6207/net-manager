class Network < ActiveRecord::Base
    validates :name, presence: true
    has_many :connections
    has_many :devices, through: :connections

    def device_array
        self.devices.collect {|d| d.info_array }
    end

end