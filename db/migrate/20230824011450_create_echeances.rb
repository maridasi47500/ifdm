class CreateEcheances < ActiveRecord::Migration[6.0]
  def change
    create_table :echeances do |t|
      t.integer :payment_id
      t.date :date
      t.float :sum

      t.timestamps
    end
  end
end
