class ContactForm
  include ActiveModel::Conversion
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  attr_reader :name, :email, :message_body

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message_body, presence: true

  def initialize(attr = {})
    @name = attr[:name]
    @email = attr[:email]
    @message_body = attr[:message_body]
  end

  def id
    1
  end

  def permitted?
    false
  end
end
