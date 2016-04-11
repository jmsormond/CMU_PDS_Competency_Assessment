# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
PDSAssessment::Application.initialize!

# for pdfkit, want the output in pdf format
Mime::Type.register 'application/pdf', :pdf