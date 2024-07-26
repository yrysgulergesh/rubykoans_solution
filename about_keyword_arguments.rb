# require File.expand_path(File.dirname(__FILE__) + '/neo')

# class AboutKeywordArguments < Neo::Koan

#   def method_with_keyword_arguments(one: 1, two: 'two')
#     [one, two]
#   end

#   def test_keyword_arguments
#     assert_equal __, method_with_keyword_arguments.class
#     assert_equal __, method_with_keyword_arguments
#     assert_equal __, method_with_keyword_arguments(one: 'one')
#     assert_equal __, method_with_keyword_arguments(two: 2)
#   end

#   def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
#     [one, two, three]
#   end

#   def test_keyword_arguments_with_wrong_number_of_arguments
#     exception = assert_raise (___) do
#       method_with_keyword_arguments_with_mandatory_argument
#     end
#     assert_match(/__/, exception.message)
#   end

#   def method_with_mandatory_keyword_arguments(one:, two: 'two')
#     [one, two]
#   end

#   def test_mandatory_keyword_arguments
#     assert_equal __, method_with_mandatory_keyword_arguments(one: 'one')
#     assert_equal __, method_with_mandatory_keyword_arguments(two: 2, one: 1)
#   end

#   def test_mandatory_keyword_arguments_without_mandatory_argument
#     exception = assert_raise(___) do
#       method_with_mandatory_keyword_arguments
#     end
#     assert_match(/__/, exception.message)
#   end

# end

# require File.expand_path(File.dirname(__FILE__) + '/neo')

# class AboutKeywordArguments < Neo::Koan

#   def method_with_keyword_arguments(one: 1, two: 'two')
#     [one, two]
#   end

#   def test_keyword_arguments
#     assert_equal Array, method_with_keyword_arguments.class  # Метод возвращает массив, поэтому его класс - Array
#     assert_equal [1, 'two'], method_with_keyword_arguments  # По умолчанию возвращает массив [1, 'two']
#     assert_equal ['one', 'two'], method_with_keyword_arguments(one: 'one')  # Заменили первый аргумент на 'one'
#     assert_equal [1, 2], method_with_keyword_arguments(two: 2)  # Заменили второй аргумент на 2
#   end

#   def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
#     [one, two, three]
#   end

#   def test_keyword_arguments_with_wrong_number_of_arguments
#     exception = assert_raise(ArgumentError) do  # Ожидаем ошибку ArgumentError
#       method_with_keyword_arguments_with_mandatory_argument
#     end
#     assert_match(/wrong number of arguments/, exception.message)  # Сообщение об ошибке содержит 'wrong number of arguments'
#   end

#   def method_with_mandatory_keyword_arguments(one:, two: 'two')
#     [one, two]
#   end

#   def test_mandatory_keyword_arguments
#     assert_equal ['one', 'two'], method_with_mandatory_keyword_arguments(one: 'one')  # Первый аргумент установлен в 'one', второй - 'two'
#     assert_equal [1, 2], method_with_mandatory_keyword_arguments(two: 2, one: 1)  # Первый аргумент - 1, второй - 2
#   end
#   def test_mandatory_keyword_arguments_without_mandatory_argument
#     exception = assert_raise(ArgumentError) do
#       method_with_mandatory_keyword_arguments
#     end
#     assert_match(/missing keyword argument: :one/, exception.message)
#   end
  
#   def test_mandatory_keyword_arguments_without_mandatory_argument
#     exception = assert_raise(ArgumentError) do  # Ожидаем ошибку ArgumentError
#       method_with_mandatory_keyword_arguments
#     end
#     assert_match(/missing keyword argument/, exception.message)  # Сообщение об ошибке содержит 'missing keyword argument'
#   end

# end

require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutKeywordArguments < Neo::Koan

  # Method with keyword arguments
  def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

  def test_keyword_arguments
    assert_equal Array, method_with_keyword_arguments.class
    assert_equal [1, 'two'], method_with_keyword_arguments
    assert_equal ['one', 'two'], method_with_keyword_arguments(one: 'one')
    assert_equal [1, 2], method_with_keyword_arguments(two: 2)
  end

  # Method with mandatory positional argument and optional keyword arguments
  def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
    [one, two, three]
  end

  def test_keyword_arguments_with_wrong_number_of_arguments
    exception = assert_raise(ArgumentError) do
      method_with_keyword_arguments_with_mandatory_argument
    end
    assert_match(/wrong number of arguments/, exception.message)
  end

  # Method with mandatory keyword arguments
  def method_with_mandatory_keyword_arguments(one:, two: 'two')
    [one, two]
  end

  def test_mandatory_keyword_arguments
    assert_equal ['one', 'two'], method_with_mandatory_keyword_arguments(one: 'one')
    assert_equal [1, 2], method_with_mandatory_keyword_arguments(two: 2, one: 1)
  end

  def test_mandatory_keyword_arguments_without_mandatory_argument
    exception = assert_raise(ArgumentError) do
      method_with_mandatory_keyword_arguments
    end
    assert_match(/missing keyword: :one/, exception.message)
  end

end
