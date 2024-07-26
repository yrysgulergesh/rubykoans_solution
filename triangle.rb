def triangle(a, b, c)
  # Сначала проверяем, что стороны больше 0
  raise TriangleError if [a, b, c].any? { |side| side <= 0 }
  
  # Проверяем, что сумма любых двух сторон больше третьей стороны
  raise TriangleError unless a + b > c && a + c > b && b + c > a

  if a == b && b == c
    :equilateral
  elsif a == b || a == c || b == c
    :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
