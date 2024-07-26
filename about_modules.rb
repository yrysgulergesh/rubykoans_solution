require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutModules < Neo::Koan
  module Nameable
    def set_name(name)
      @name = name
    end

    def get_name
      @name
    end
  end

  class Dog
    include Nameable
  end

  def test_cant_instantiate_modules
    assert_raise(NoMethodError) do
      Nameable.new
    end
  end

  def test_classes_can_use_modules
    fido = Dog.new
    assert fido.is_a?(Nameable)
  end

  module Outer
    module Inner
      def self.greeting
        'Hi from the inner module!'
      end
    end
  end

  def test_modules_can_be_nestled_inside_other_modules
    assert_equal 'Hi from the inner module!', Outer::Inner.greeting
  end

  class NestedClass
    def self.greeting
      'Hello from the nested class!'
    end
  end

  def test_nested_classes_can_be_referenced_using_the_scope_operator
    assert_equal 'Hello from the nested class!', AboutModules::NestedClass.greeting
  end
end
