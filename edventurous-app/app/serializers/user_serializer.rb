class UserSerializer < ActiveModel::Serializer
  attributes :id, :name 
  has_many :bookings 
  has_many :field_experiences, through: :bookings
end
