# frozen_string_literal: true

# config for Application Mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'caren.test.email@gmail.com'
  layout 'mailer'
end
