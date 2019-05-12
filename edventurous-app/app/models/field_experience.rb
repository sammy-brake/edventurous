class FieldExperience < ApplicationRecord
    has_many :bookings 
    has_many :users, through: :bookings

    scope :search_by_subject, -> (search_subject){where("subject = ?", search_subject)}

   
end
