=begin
require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal __, empty_array.class
    assert_equal __, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, __], array

    array << 333
    assert_equal __, array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __, array[0]
    assert_equal __, array.first
    assert_equal __, array[3]
    assert_equal __, array.last
    assert_equal __, array[-1]
    assert_equal __, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __, array[0,1]
    assert_equal __, array[0,2]
    assert_equal __, array[2,2]
    assert_equal __, array[2,20]
    assert_equal __, array[4,0]
    assert_equal __, array[4,100]
    assert_equal __, array[5,0]
  end

  def test_arrays_and_ranges
    assert_equal __, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal __, (1..5).to_a
    assert_equal __, (1...5).to_a
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __, array[0..2]
    assert_equal __, array[0...2]
    assert_equal __, array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal __, array

    popped_value = array.pop
    assert_equal __, popped_value
    assert_equal __, array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal __, array

    shifted_value = array.shift
    assert_equal __, shifted_value
    assert_equal __, array
  end

end 
=end

require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  # Массивди түзүү тест
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class  # Массивдин классы "Array" болушу керек
    assert_equal 0, empty_array.size       # Бош массивдин өлчөмү 0 болушу керек
  end

  # Массивдин элементтерин түзүү жана кошуу тест
  def test_array_literals
    array = Array.new
    assert_equal [], array  # Бош массивди текшерүү

    array[0] = 1
    assert_equal [1], array # Биринчи элементке 1ди кошуу

    array[1] = 2
    assert_equal [1, 2], array # Экинчи элементке 2ни кошуу

    array << 333
    assert_equal [1, 2, 333], array # Массивдин аягына 333 кошуу
  end

  # Массивдин элементтерине кирүү тест
  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]   # Биринчи элементке кирүү
    assert_equal :peanut, array.first # Биринчи элементке кирүү (first методу менен)
    assert_equal :jelly, array[3]    # Төртүнчү элементке кирүү
    assert_equal :jelly, array.last  # Акыркы элементке кирүү (last методу менен)
    assert_equal :jelly, array[-1]   # Тескерисинче саноо менен акыркы элементке кирүү
    assert_equal :butter, array[-3]  # Тескерисинче саноо менен үчүнчү элементке кирүү
  end

  # Массивден кесимдерди алуу тест
  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0, 1]        # Биринчи элементти алуу
    assert_equal [:peanut, :butter], array[0, 2]  # Биринчи жана экинчи элементти алуу
    assert_equal [:and, :jelly], array[2, 2]     # Үчүнчү жана төртүнчү элементти алуу
    assert_equal [:and, :jelly], array[2, 20]    # Үчүнчү элементтен баштап калган элементтерди алуу
    assert_equal [], array[4, 0]               # Төртүнчү индекстен баштап нөл элементти алуу (бош массив)
    assert_equal [], array[4, 100]             # Төртүнчү индекстен баштап жүз элементти алуу (бош массив)
    assert_equal nil, array[5, 0]              # Бешинчи индекстен баштап нөл элементти алуу (nil)
  end

  # Массивдер жана диапазондор (ranges) тест
  def test_arrays_and_ranges
    assert_equal Range, (1..5).class    # Диапазондун классын текшерүү
    assert_not_equal [1, 2, 3, 4, 5], (1..5) # Диапазон массив эмес экенин текшерүү
    assert_equal [1, 2, 3, 4, 5], (1..5).to_a # Диапазонду массивге айландыруу
    assert_equal [1, 2, 3, 4], (1...5).to_a  # Диапазонду массивге айландыруу (акыркы санды кошпоо менен)
  end

  # Диапазон (range) колдонуп кесимдерди алуу тест
  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]  # 0дон 2ге чейин элементтерди алуу
    assert_equal [:peanut, :butter], array[0...2]       # 0дон 2ге чейин элементтерди алуу (акыркы санды кошпоо менен)
    assert_equal [:and, :jelly], array[2..-1]           # 2-индекстен баштап калган элементтерди алуу
  end

  # Массивге элементтерди кошуу жана алып салуу тест
  def test_pushing_and_popping_arrays
    array = [1, 2]
    array.push(:last)

    assert_equal [1, 2, :last], array   # Массивге элементти кошуу

    popped_value = array.pop
    assert_equal :last, popped_value    # Массивден акыркы элементти алып салуу
    assert_equal [1, 2], array          # Массивдин жаңы абалын текшерүү
  end

  # Массивдин башына элементтерди кошуу жана алып салуу тест
  def test_shifting_arrays
    array = [1, 2]
    array.unshift(:first)

    assert_equal [:first, 1, 2], array  # Массивдин башына элементти кошуу

    shifted_value = array.shift
    assert_equal :first, shifted_value  # Массивден биринчи элементти алып салуу
    assert_equal [1, 2], array          # Массивдин жаңы абалын текшерүү
  end
end
