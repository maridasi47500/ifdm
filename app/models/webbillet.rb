class Webbillet < ApplicationRecord
def flyer=(uploaded_io)
File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:flyer, uploaded_io.original_filename)
end
def self.recent
order(:created_at => :desc)
end
def flyer
read_attribute(:flyer)
end
end
