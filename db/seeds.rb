# Import Parters from lib/seeds/businesses-seed
require 'csv'

if Business.count == 0
  CSV.foreach("lib/seeds/businesses-seed.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    Business.create(row.to_hash)
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?