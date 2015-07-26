require 'rest-client'
require 'awesome_print'
require 'nokogiri'
require 'nokogiri-styles'


# This takes whatever is passed in after the command as an argument
# search_term = ARGV.join(' ')


# go to the website.....
# pass in a url
# response = RestClient.get('http://www.montana-cans.com/products/Cans/Montana_BLACK/Montana_BLACK_400ml/20')
response = open('./montana_gold.html')
# puts response

# Nokogiri parses through html and returns something readable
document = Nokogiri::HTML(response)

# get montana
# result_sku = document.css('.color-item.bright span').each do |span|
  # puts span.text
# end
# result_color = document.css('.color-item.bright')[0].parent.styles['background']

document.css('.color-item.bright').each do |item|
  puts item.css('span').text
  puts item.parent.styles['background']
end

# get colors
ap result_sku
ap result_color
# $(document).find('.color-item.bright:contains("BLK 1005")').find('span').first().text()
# "BLK 1005            "

# search the DOM for information
# extract that information
# save it
# reference it