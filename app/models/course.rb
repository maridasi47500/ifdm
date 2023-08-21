class Course < ApplicationRecord
 has_and_belongs_to_many :users, :join_table => :userhascourses
  attr_accessor :quantite
 include ActionView::Helpers::SanitizeHelper
  def self.mycourse
   all.select("courses.*, row_number() over(order by courses.id) as rownum").group(:id)
  end
 def mytitle 
   if Course.where(type:self.type,name: self.name).length > 1
   strip_tags(self.description).split("\n")[0]
   else
    name.titleize
   end
 end
 def name
  read_attribute(:name)
  end
 def name=(x)
  write_attribute(:name,x.gsub("COURS COLLECTIFS DE ","").gsub("COURS INDIVIDUELS DE ",""))
  end
def image=(uploaded_io)
  File.open(Rails.root.join('public','uploads',uploaded_io.original_filename),'wb') do |file|
    file.write(uploaded_io.read)
  end
  write_attribute(:image, uploaded_io.original_filename)
rescue
  write_attribute(:image, uploaded_io)
end
def image 
  read_attribute(:image)
end
def icon=(uploaded_io)
  File.open(Rails.root.join('public','uploads',uploaded_io.original_filename),'wb') do |file|
    file.write(uploaded_io.read)
  end
  write_attribute(:icon, uploaded_io.original_filename)
rescue
  write_attribute(:icon, uploaded_io)
end
def icon
  read_attribute(:icon)
end
end
