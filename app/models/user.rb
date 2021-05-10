class User < ActiveRecord::Base
    has_many :networks
end