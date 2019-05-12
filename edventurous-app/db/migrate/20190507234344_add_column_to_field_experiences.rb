class AddColumnToFieldExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :field_experiences, :gradelevels, :string
  end
end
