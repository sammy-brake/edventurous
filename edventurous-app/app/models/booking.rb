class Booking < ApplicationRecord
    belongs_to :field_experience
    belongs_to :user 
    validates :date, presence: true 
end
