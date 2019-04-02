class ContactForm
  include ActiveModel::Model

  attr_accessor :name, :email, :message_body

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message_body, presence: true

end
