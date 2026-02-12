FactoryBot.define do
  factory :quote_request do
    full_name { "John Doe" }
    email { "john@example.com" }
    phone { "1234567890" }
    vehicle_make { "Toyota" }
    vehicle_model { "Camry" }
    vehicle_year { 2022 }
    service_type { "Change Oil" }
    issue_description { "Engine making a clicking sound." }
  end
end
