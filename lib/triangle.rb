class Triangle

  class TriangleError < StandardError 

  end

  attr_accessor :side_1, :side_2, :side_3 
  
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2 
    @side_3 = side_3
  end 

  def kind 

    validate_triangle 
     
    if (@side_1 == @side_2) && (@side_1 == @side_3) && (@side_2 == @side_3)
      return :equilateral
    elsif (@side_1 == @side_2) || (@side_1 == @side_3) || (@side_2 == @side_3)
      return :isosceles
    elsif (@side_1 != @side_2) && (@side_1 != @side_3) && (@side_2 != @side_3)
      return :scalene 
    end

  end 

  def validate_triangle 

    valid = nil 

    not_zero = (@side_1 > 0) && (@side_2 > 0) && (@side_3 > 0) 
    inequality = (@side_1 + @side_2 > @side_3) && (@side_1 + @side_3 > @side_2) && (@side_2 + @side_3 > @side_1)

    if not_zero && inequality 
      valid = true 
    else 
      valid = false 
    end 
      
    raise TriangleError if valid == false  

  end 

end
