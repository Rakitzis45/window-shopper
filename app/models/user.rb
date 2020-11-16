class User < ActiveRecord::Base
    has_many :list
    has_many :items, through: :list

    has_secure_password
end