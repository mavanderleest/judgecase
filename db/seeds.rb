# Import Parters from lib/seeds/businesses-seed
require 'csv'

CSV.foreach("lib/seeds/businesses-seed.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  Business.create(row.to_hash)
end
