class Object
  def blank?
    false
  end

  def try(*args)
    send(*args) if respond_to?(args.first)
  end
end

class Hash
  def except(keys=[])
    keys = [keys].flatten
    self.reject { |k,v| keys.include?(k) }
  end
end

class String
  def blank?
    self.strip == ""
  end

  def color?
    if self.include? '#' and self.size > 6
      return true
    end

    return false
  end

  def color_with_alpha?
    if self.include? '#' and self.size > 7
      return true
    end

    return false
  end

  def to_hex_color
    self[0..6]
  end

  def to_hex_alpha
    (100 * ((self[7,8]).to_i(16) / 255.0)).round
  end

  def dasherize
    self.downcase.gsub(/[^0-9A-Za-z]/, ' ').squeeze(' ').gsub(' ', '-').strip
  end
end

class NilClass
  def blank?
    true
  end

  def dasherize
    self
  end
end

class FalseClass
  def to_i
    0
  end
end

class TrueClass
  def to_i
    1
  end
end
