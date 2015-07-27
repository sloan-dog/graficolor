require 'rake'

task :environment do
  puts 'task environment'
end

namespace :sloan do
  task :populate do
    Rake::Task[':environment'].invoke

  # response = RestClient.get('http://www.montana-cans.com/products/Cans/Montana_BLACK/Montana_BLACK_400ml/20')
  response = open('bin/montana_gold.html')
  # puts response

  # Nokogiri parses through html and returns something readable
  document = Nokogiri::HTML(response)

  # get montana black colors and skus
  paints = Hash.new



  document.css('.color-item.bright').each do |item|
    paint_name = item.css('span').text.strip
    # take the '#FFFFFF' format and remove the hash
    filtered = /\w+/.match(item.parent.styles['background']).to_s
    # puts filtered
    components = filtered.scan(/.{2}/)
    # puts components
    # components = components.map{|component| component.match(/[0-9A-Fa-f]{2}/)}
    # puts components
    # components = components.map { |component| component.hex}
    paints[paint_name]=filtered
    Paint.create(name:paint_name,component1:filtered)
  end





  end
end



