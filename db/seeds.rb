# Import Parters from lib/seeds/parter-seeds
require 'csv'

CSV.foreach("lib/seeds/partner-seeds.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  Partner.create(row.to_hash)
end
