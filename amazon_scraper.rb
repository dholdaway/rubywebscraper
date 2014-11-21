require 'open-uri'
require 'nokogiri'
require 'csv'

# Store url
url = "http://www.amazon.co.uk/Best-Sellers-PC-Video-Games-PlayStation/zgbs/videogames/676471011/ref=zg_bs_nav_vg_h__2_676457011?pf_rd_p=547584167&pf_rd_s=merchandised-search-5&pf_rd_t=101&pf_rd_i=300703&pf_rd_m=A3P5ROKL5A1OLE&pf_rd_r=1DJQAP0KA78MAEZ2Q4RC"

#parse the page with nokogiri
page = Nokogiri::HTML(open(url))

puts page.at_css("title").text

#puts page.css("zg_title").text

#puts page.css('zg_title')
#page.css('div.zg_itemImageImmersion')

page.css('div.zg_title').each do |line|
	puts line.text
end

puts page.css('p').css("div a img")

#div a img

#puts page.css("zg_image")[0].text

page.css('zg_rankDiv zg_rankNumber').each do |line|
	puts line.text
end

#page.css('p').css("a[data-category=news]").css("strong")

puts page.css('div.zg_itemImageImmersion').text

#page.css('div.zg_itemImageImmersion').each do |line|
#		name << line.text.strip
#	end