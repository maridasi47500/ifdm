class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.boolean :payonce
      t.string :moyen
      t.integer :option

      t.timestamps
    end
  end
end
