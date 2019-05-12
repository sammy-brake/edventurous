class AddForeignKeysToBookings < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :bookings, :users
    add_foreign_key :bookings, :field_experiences

  end
end
