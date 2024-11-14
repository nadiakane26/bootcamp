class Contact < ApplicationRecord
    # Validate presence of name, email, and message
    validates :name, presence: true
    validates :email, presence: true #, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email address" }
    validates :message, presence: true
  end