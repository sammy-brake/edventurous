class User < ApplicationRecord
    has_many :bookings 
    has_many :field_experiences, through: :bookings
    has_secure_password 
    validates :email, :name, :password, presence: true 
    validates :email, uniqueness: true



    
end
