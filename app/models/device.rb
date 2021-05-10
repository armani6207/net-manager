class Device < ActiveRecord::Base
    has_many :connections
    has_many :networks, through: :connections

    def info_array
        [self.name, self.id]
    end

end