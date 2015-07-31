require 'rest-client'
require 'awesome_print'
require 'nokogiri'
require 'nokogiri-styles'

rustoleum = open('satin.html')

rustoleum_parsed = Nokogiri::HTML(rustoleum)

# ap rustoleum_parsed
# node = Nokogiri::XML::Node.new('candy', rustoleum_parsed)

rust_chips = rustoleum_parsed.css('ul.color-chips').css('li')

rust_chips.each do |c|
  ap sku = ("Painters Touch " + c.css('@data-lskunumber').text)
  color = c.css('@style').text
  ap color = color.match(/[^#]+$/).to_s[0...-1]
end

# ap rustoleum_parsed.css('ul.color-chips').css('li').first.css('@data-lskunumber').text

# bc = rustoleum_parsed.css('ul.color-chips').css('li').first.css('@style').text

# ap bc

# ap bc = bc.match(/[^#]+$/).to_s[0...-1]


# doc.xpath('//div/a/@href')



# <a id="main_0_container4_0_rptSkuCategories_rColorChip_0_hlColorChip_30" title="Satin Fossil
# 249080 - 12 oz. Spray" class="color-chip" data-lcolor="Satin Fossil" data-lsize="12 oz. Spray" data-lskunumber="249080" data-iproductimage="/~/media/DigitalEncyclopedia/Product/RustoleumUSA/CBG/painters-touch-ultra-cover-2x/satin/249080_0213_PTO_12oz_2xUltraCover_Satin_Fossil.ashx" style="background-color:#beb898;"></a>

