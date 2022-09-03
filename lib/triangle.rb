class Triangle
  attr_reader :sides

  def initialize(s1,s2,s3)
    @sides = [s1,s2,s3]
  end

  def kind
    validate_tri
    
    if @sides.uniq.length == 1
      :equilateral
    elsif @sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  def negative_zero_check 
    @sides.all?(&:positive?)
  end

  def triangle_inequality
    @sides[0]+@sides[1]>@sides[2] &&@sides[0]+@sides[2]>@sides[1]&&@sides[1]+@sides[2]>@sides[0]
  end
  
  def validate_tri
    raise TriangleError unless negative_zero_check && triangle_inequality
  end

  class TriangleError < StandardError
  end
end
