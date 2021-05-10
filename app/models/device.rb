class Device < ActiveRecord::Base
    has_many :connections
    has_many :networks, through: :connections
end