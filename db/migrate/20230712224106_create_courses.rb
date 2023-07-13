class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :type
      t.string :image
      t.string :icon
      t.text :description

      t.timestamps
    end
  end
end
