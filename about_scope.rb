require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutScope < Neo::Koan
  class Dog
    def bark
      "WOOF"
    end
  end

  def test_dog_is_not_available_in_the_current_scope
    assert_raise(NameError) do
      fido = Dog.new
    end
  end

  def test_you_can_reference_nested_constants_using_the_scope_operator
    fido = AboutScope::Dog.new
    assert_equal "WOOF", fido.bark
  end

  class Animal
    def sound
      "Generic Animal Sound"
    end
  end

  def test_nested_classes_are_also_available_within_the_parent_class
    animal = Animal.new
    assert_equal "Generic Animal Sound", animal.sound
  end

  class Bird < Animal
    def sound
      "Chirp"
    end
  end

  def test_you_can_reference_classes_inherited_from_nested_classes
    bird = Bird.new
    assert_equal "Chirp", bird.sound
    assert_equal "Generic Animal Sound", Bird.superclass.new.sound
  end
end
