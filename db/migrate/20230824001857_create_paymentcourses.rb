class CreatePaymentcourses < ActiveRecord::Migration[6.0]
  def change
    create_table :paymentcourses do |t|
      t.integer :course_id
      t.integer :qty
      t.integer :payment_id

      t.timestamps
    end
  end
end
