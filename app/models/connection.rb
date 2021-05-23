class Connection < ActiveRecord::Base
    validates :device_nick_name, presence: true
    validates :device_id, presence: true
    validates :network_id, presence: true
    belongs_to :network
    belongs_to :device
end