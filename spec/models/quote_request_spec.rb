require 'rails_helper'

RSpec.describe QuoteRequest, type: :model do
  let(:quote_request) { build(:quote_request) }

  describe "Personal Information" do
    describe "full_name" do
      it "is required" do
        quote_request.full_name = nil
        expect(quote_request).not_to be_valid
      end
    end

    describe "phone" do
      context "when it has letters" do
        it "is invalid" do
          quote_request.phone = "1234567890a"
          expect(quote_request).not_to be_valid
        end
      end

      context "when it is too short" do
        it "is invalid" do
          quote_request.phone = "1234567"
          expect(quote_request).not_to be_valid
        end
      end
    end
  end

  describe "Vehicle Information" do
    describe "vehicle_year" do
      context "when the year is before 1885" do
        it "is invalid" do
          quote_request.vehicle_year = 1800
          expect(quote_request).not_to be_valid
        end
      end

      context "when the year is in the distant future" do
        it "is invalid" do
          quote_request.vehicle_year = 2050
          expect(quote_request).not_to be_valid
        end
      end
    end
  end

  describe "Service Type" do
    it "is valid" do
      quote_request.service_type = "Change Oil"
      expect(quote_request).to be_valid
    end
  end
end
