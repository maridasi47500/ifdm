class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :nb
      t.date :expire
      t.string :cvc
      t.float :sum
      t.integer :payment_id

      t.timestamps
    end
  end
end
