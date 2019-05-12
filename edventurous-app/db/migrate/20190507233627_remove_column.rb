class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :grade
  end
end
