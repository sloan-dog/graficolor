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

# get montana black colors and skus
paints = Hash.new[]
document.css('.color-item.bright').each do |item|
  paint_name = item.css('span').text
  # take the '#FFFFFF' format and remove the hash
  filtered = /\w+/.match(item.parent.styles['background']).to_s
  # puts filtered
  components = filtered.scan(/.{2}/)
  # puts components
  # components = components.map{|component| component.match(/[0-9A-Fa-f]{2}/)}
  # puts components
  # components = components.map { |component| component.hex}
  paints[paint_name=>filtered]



end

# get colors
# ap result_sku
# ap result_color

# white = "FFFFFF"
# components =  white.scan(/[0-9A-Fa-f]{2}/)
# components.each do |component|
#   puts component.hex
# end
# $(document).find('.color-item.bright:contains("BLK 1005")').find('span').first().text()
# "BLK 1005            "

# search the DOM for information
# extract that information
# save it
# reference it