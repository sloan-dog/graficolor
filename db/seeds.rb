# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'open-uri'


  # MONTANA BLACK SCRAPE
  # ////////////////////
  # response = RestClient.get('http://www.montana-cans.com/products/Cans/Montana_BLACK/Montana_BLACK_400ml/20')
  response = open('bin/montana_gold.html')

  document = Nokogiri::HTML(response)

  paints = Hash.new

  document.css('.color-item.bright').each do |item|
    paint_name = item.css('span').text.strip
    filtered = /\w+/.match(item.parent.styles['background']).to_s
    # components = filtered.scan(/.{2}/)
    # components = components.map{|component| component.match(/[0-9A-Fa-f]{2}/)}
    # components = components.map { |component| component.hex}
    paints[paint_name]=filtered
    Paint.create(name:paint_name,component1:paints[paint_name],brand_id:1)
  end
  puts paints


  # RUSTOLEUM PAINTERS TOUCH SCRAPE
  # /////////////////////////////
  rustoleum = open('bin/satin.html')

  rustoleum_parsed = Nokogiri::HTML(rustoleum)

  rust_chips = rustoleum_parsed.css('ul.color-chips').css('li')

  rust_chips.each do |c|
    ap sku = ("Painters Touch " + c.css('@data-lskunumber').text)
    color = c.css('@style').text
    ap color = color.match(/[^#]+$/).to_s[0...-1]
    Paint.create(name:sku,component1:color,brand_id:2)
  end

