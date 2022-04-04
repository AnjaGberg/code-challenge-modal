class Invitation < ApplicationRecord
  belongs_to :cycle
  validates_presence_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
