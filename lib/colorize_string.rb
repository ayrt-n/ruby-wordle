# Extension of String class to allow printing colored characters
class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def black
    colorize(30)
  end

  def bg_green
    colorize(42)
  end

  def bg_red
    colorize(41)
  end

  def bg_yellow
    colorize(43)
  end

  def bg_grey
    colorize(47)
  end
end