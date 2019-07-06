class BookingSerializer < ActiveModel::Serializer
  attributes :id, :date, :user_id, :field_experience_id
  belongs_to :field_experience
  belongs_to :user 


  # remove this and use for method on prototype 
  def formatDate 
    booking.date.strftime("%b %d, %Y")
  end 

  
end

