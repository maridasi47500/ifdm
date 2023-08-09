class CreateUserhascourses < ActiveRecord::Migration[6.0]
  def change
    create_table :userhascourses do |t|
      t.integer :user_id
      t.integer :course_id
    end
    create_table :weekdays do |t|
      t.string :name
    end
    create_table :schedules do |t|
      t.string :name
    end
    create_table :userweekdays do |t|
      t.integer :user_id
      t.integer :weekday_id
    end
    create_table :houruserweekdays do |t|
      t.integer :schedule_id
      t.integer :userweekday_id
    end
  end
end
