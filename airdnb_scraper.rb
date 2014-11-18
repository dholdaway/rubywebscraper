require 'open-uri'
require 'nokogiri'
require 'csv'

# Store url
url = "https://www.airbnb.co.uk/s/London--United-Kingdom"

#parse the page with nokogiri 
page = Nokogiri::HTML(open(url))

page_numbers = []
page.css("div.pagination ul li a[target]").each do |line|
	page_numbers << line.text
end


# scrap the max number of pages and store in max page variable 
max_page = page_numbers.max

#empty arrays
name = []
price = []
details = []

#loop once for every page
max_page.to_i.times do |i|



	url = "https://www.airbnb.co.uk/s/London--United-Kingdom?page=#{i+1}"
	page = Nokogiri::HTML(open(url))
	
	#store data in arrays
	page.css('div.h5.listing-name').each do |line|
		name << line.text.strip
	end
	
	page.css('span.h3.price-amount').each do |line|
		price << line.text
	end

	page.css('div.text-muted.listing-location.text-truncate').each do |line|
		details << line.text.strip.split(/ . /)
	end
end

# write arrays to csv
CSV.open("airbnb_listing.csv", "w") do |file|
	file << ["Listing Name", "Price", "Room Type", "Reviews", "Location"]

	name.length.times do |i|
		file << [name[i], price[i], details[i][0], details[i][1], details[i][2]]
	end
end