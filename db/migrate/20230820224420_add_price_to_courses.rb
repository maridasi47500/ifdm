class AddPriceToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :price, :float
  end
end
