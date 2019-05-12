class RemoveColumnFromFieldExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :field_experiences, :grades
   
  end
end
