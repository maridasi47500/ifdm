class CreateWebbillets < ActiveRecord::Migration[6.0]
  def change
    create_table :webbillets do |t|
      t.string :flyer
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
