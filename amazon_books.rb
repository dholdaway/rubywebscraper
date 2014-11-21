require 'nokogiri'

url = 'http://www.amazon.com/s/ref=sr_st_review-rank?keywords=ruby+on+rails&qid=1405713252&rh=n%3A283155%2Ck%3Aruby+on+rails&sort=review-rank'
doc = Nokogiri::HTML(open(url))

rails_books = doc.css("a.title").map { |book| "#{book.text} - #{book.attribute('href').to_s}" }

puts rails_books[0..9]