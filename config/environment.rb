# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# code below will remove the field_with_errors class provided by rails since I am using bootstrap 
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end