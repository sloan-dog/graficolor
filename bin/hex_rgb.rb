r = components[0]/255.to_f
    g = components[1]/255.to_f
    b = components[2]/255.to_f
    puts [r,g,b]
    max = [r, g, b].max
    min = [r, g, b].min
    h = s = v = max

    puts v

    d = max - min
    s = (max == 0 ? 0 : d / max)

    if(max == min)
        h = 0 # achromatic
    else
        case max
            when r
              h = (g - b) / d + (g < b ? 6 : 0)
            when g
             h = (b - r) / d + 2
            when b
             h = (r - g) / d + 4
        end
        h = h % 6;
    end

    return [h, s, v];
  end
