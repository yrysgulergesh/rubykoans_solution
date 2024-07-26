require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutModules < Neo::Koan
  module Nameable
    def set_name(name)
      @name = name
    end

    def name
      @name
    end
  end

  class Dog
    include Nameable
  end

  def test_dog_has_nameable_module
    fido = Dog.new
    assert_equal nil, fido.name
    fido.set_name("Fido")
    assert_equal "Fido", fido.name
  end

  module Outer
    module Inner
      def inner_method
        :inner_value
      end
    end

    class NestedClass
      include Inner
    end
  end

  def test_modules_can_be_nested
    assert_equal :inner_value, Outer::NestedClass.new.inner_method
  end
end

