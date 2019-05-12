class AddForeignKeysToBookingsAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :user_id, :integer
    add_column :bookings, :field_experience_id, :integer
  end
end
