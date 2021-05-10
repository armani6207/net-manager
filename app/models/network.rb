class Network < ActiveRecord::Base
    has_many :connections
    has_many :devices, through: :connections
end