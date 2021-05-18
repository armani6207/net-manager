class Device < ActiveRecord::Base
    has_many :connections
    has_many :networks, through: :connections

    def info_array
        [self.name, self.id]
    end

    def network_count
        self.networks.count
    end

    def self.by_type(type)
        where(device_type: type)
    end

end