class User < ApplicationRecord
  has_many :payments
  accepts_nested_attributes_for :payments, allow_destroy: true
  attr_accessor :terms
  attr_accessor :mytype
  validates :terms, acceptance: { message: "J'ai lu et j'accepte les conditions générales d'inscription." }
  belongs_to :level, foreign_key:"level_id"
  has_and_belongs_to_many :courses, :join_table => :userhascourses
  has_many :userweekdays
  has_many :weekdays, :through => :userweekdays
  accepts_nested_attributes_for :userweekdays, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
