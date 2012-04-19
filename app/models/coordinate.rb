class Coordinate < ActiveRecord::Base

  def re_type
     value = read_attribute(:re_type)

    case value
      when 1
        "Office"
      when 2
        "Retail"
      when 3
        "R&D"
      when 4
        "Industrial"
      else
        "Error"
    end
  end

  def term
    value = read_attribute(:term)

    case value
      when 1
        "Sale"
      when 2
        "Lease"
      else
        "Error"
    end
  end

end
