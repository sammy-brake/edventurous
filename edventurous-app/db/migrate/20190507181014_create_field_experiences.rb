class CreateFieldExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :field_experiences do |t|
      t.string :title
      t.string :subject
      t.string :grades
      t.string :location
      t.string :summary

      t.timestamps
    end
  end
end
