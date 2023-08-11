# Place this code in a initializer. 
# E.g: config/initializers/form_errors.rb
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  fragment = Nokogiri::HTML.fragment(html_tag)
  field = fragment.at('input,select,textarea')

  html = if field
           field['class'] = "#{field['class']} invalid"
           html = <<-HTML
              #{fragment&.to_s}
       <p class="myerrorMessage" style="display:block;color:red;" elname="error" id="error-#{field['class'].titleize.gsub(" ","-")}">
       #{instance_tag&.error_message&.first}</p>
           HTML
           html
         else
           html_tag
         end

  html.html_safe
end
