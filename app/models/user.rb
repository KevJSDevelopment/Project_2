class User < ApplicationRecord
    has_many :orders
    has_many :wishlists
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    has_secure_password
end
