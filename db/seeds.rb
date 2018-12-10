# puts "Cleaning previous data"
# ShippingCategory.destroy_all

# puts "Starting seed"

# weights = [250, 500, 750, 1000, 2000, 5000, 10000, 30000]

# prices = { "METRO": [495, 615, 700, 765, 865, 1315, 1920, 2730],
#     "Outre-Mer 1": [930, 930, 1410, 1410, 1920, 2890, 4640, 10360],
#     "Outre-Mer 2": [1120, 1120, 1680, 1680, 2960, 4960, 9690, 25000],
#     "UE": [1230, 1230, 1505, 1505, 1680, 2150, 3550, 5900],
#     "Eastern Europe Norvège and Maghreb": [1640, 1640, 1960, 1960, 2140, 2750, 4550, 7100],
#     "Rest of the world": [2400, 2400, 2670, 2670, 3670, 5370, 10150, 16200]
# }

# known_countries = ["FR", "AD", "MC", "GF", "GP", "MQ", "YT", "MF", "PM", "BL", "WF", "PF", "NC", "TF", "AT", "DE", "BE", "BG", "HR", "CY", "DK", "ES", "EE", "FI", "GR", "HU", "IE", "IT", "LV", "LT", "LU", "MT", "NL", "PL", "PT", "CZ", "RO", "GB", "SK", "SI", "SE", "CH", "LI", "VA", "SM", "DZ", "NO", "MR", "EH", "MA", "TN", "LY", "BY", "BA", "MD", "ME", "AL", "MK"]

# countries_classification = {
#   "METRO": ["FR", "AD", "MC"],
#   "Outre-Mer 1": ["GF", "GP", "MQ", "YT", "MF", "PM", "BL"],
#   "Outre-Mer 2": ["WF", "PF", "NC", "TF"],
#   "UE": ["AT", "DE", "BE", "BG", "HR", "CY", "DK", "ES", "EE", "FI", "GR", "HU", "IE", "IT", "LV", "LT", "LU", "MT", "NL", "PL", "PT", "CZ", "RO", "GB", "SK", "SI", "SE", "CH", "LI", "VA", "SM"],
#   "Eastern Europe Norvège and Maghreb": ["DZ", "NO", "MR", "EH", "MA", "TN", "LY", "BY", "BA", "MD", "ME", "AL", "MK"],
#   "Rest of the world": ["ZZ"]
# }


# area_name = ["METRO", "Outre-Mer 1", "Outre-Mer 2", "UE", "Eastern Europe Norvège and Maghreb", "Rest of the world"]

# ISO3166::Country.countries.each do |country|
#   weights.each_with_index do |weight, index|
#     if known_countries.include? country.alpha2
#       countries_classification.each do |k,v|
#         if countries_classification[k].include? country.alpha2
#           ShippingCategory.create(name: country.name, alpha2: country.alpha2, weight: weight, price_cents: prices[k][index])
#         end
#       end
#     else
#       ShippingCategory.create(name: country.name, alpha2: country.alpha2, weight: weight, price_cents: prices[:"Rest of the world"][index])
#     end
#   end
# end

# DB translation

# Article translation :
# require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'articles.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   Article.find_by_id(row['Id'].to_i).update(content: row['Content']) if Article.find_by_id(row['Id'].to_i)
# end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'ceramiques.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   Ceramique.find_by_id(row['Id'].to_i).update(description: row['Description'], name: row['Nom']) if Ceramique.find_by_id(row['Id'].to_i)
# end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   Category.find_by_id(row['Id'].to_i).update(name: row['Nom']) if Category.find_by_id(row['Id'].to_i)
# end

# Ceramique.reindex

# Order update for bills

Order.all.each do |order|
  order.basketlines.each do |basketline|
    if basketline.ceramique
      basketline.ceramique.offer ? ceramique_discount = basketline.ceramique.offer.discount : ceramique_discount = 0
      basketline.update(
        ceramique_name: basketline.ceramique.name,
        ceramique_qty: basketline.quantity,
        basketline_price: ((basketline.ceramique.price * (1 - ceramique_discount)) * basketline.quantity)
        )
    end
  end
end