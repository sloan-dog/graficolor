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

  def hex_hsv
     hex = self.component1

      puts hex

      components = hex.scan(/.{2}/)
      puts components
      components = components.map{ |component| component.match(/[0-9A-Fa-f]{2}/).to_s}
      puts components
      components = components.map { |component| component.to_i(16)}
      puts components

    r = components[0]/255.to_f
    g = components[1]/255.to_f
    b = components[2]/255.to_f



      r = r / 255.0
      g = g / 255.0
      b = b / 255.0
      max = [r, g, b].max
      min = [r, g, b].min
      delta = max - min
      v = (max * 100).round(3)

      if (max != 0.0)
        s = delta / max *100
      else
        s = 0.0
      end
      s = s.round(3)

      if (s == 0.0)
        h = 0.0
      else
        if (r == max)
          h = (g - b) / delta
        elsif (g == max)
          h = 2 + (b - r) / delta
        elsif (b == max)
          h = 4 + (r - g) / delta
        end

        h *= 60.0

        if (h < 0)
          h += 360.0
        end
      end
      h = h.round(3)
      return [h,s,v]
    end








end
