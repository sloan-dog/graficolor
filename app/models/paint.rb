class Paint < ActiveRecord::Base
  belongs_to :brand
  has_and_belongs_to_many :palettes

  def hex_rgb
  hex = self.component1

  components = hex.scan(/.{2}/)
  puts components
  components = components.map{ |component| component.match(/[0-9A-Fa-f]{2}/).to_s}
  puts components
  components = components.map { |component| component.to_i(16)}
  puts components

  return components

  end

end
