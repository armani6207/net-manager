class Connection < ActiveRecord::Base
    belongs_to :network
    belongs_to :device
end