class QuoteRequest < ApplicationRecord
  validates :full_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone,
            presence: true,
            format: { with: /\A\d+\z/, message: "must contain only numbers" },
            length: { minimum: 10, maximum: 13 }
  validates :issue_description, presence: true
  validates :vehicle_make, presence: true
  validates :vehicle_model, presence: true
  validates :vehicle_year, numericality: {
              only_integer: true,
              greater_than: 1885, # When the first car was invented!
              less_than_or_equal_to: ->(_req) { Time.current.year + 1 }
            }, allow_nil: true
  validates :service_type, presence: true

  before_save :normalize_details

  private

  def normalize_details
    self.email = email.downcase.strip if email.present?
    self.phone = phone.gsub(/\D/, "") if phone.present?
  end
end
