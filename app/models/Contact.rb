class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :nom,:prenom,:email, :subject, :message

  validates :nom, presence: true, length: {maximum: 100}
  validates :prenom, presence: true, length: {maximum: 100}
  validates :subject, presence: true, length: {maximum: 100}
  validates :message, presence: true, length: {maximum: 2000}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, length: {maximum: 100}

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end