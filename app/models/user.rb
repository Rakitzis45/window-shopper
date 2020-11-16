class User < ActiveRecord::Base
    has_many :list
    has_many :items, through: :list

    has_sercure_password
end