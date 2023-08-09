class User < ApplicationRecord
  belongs_to :level
  has_and_belongs_to_many :courses, :join_table => :userhascourses
  has_many :userweekdays
  has_many :weekdays, :through => :userweekdays
  accepts_nested_attributes_for :userweekdays, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
