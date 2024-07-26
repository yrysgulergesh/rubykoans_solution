require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutModules < Neo::Koan
  module Nameable
    def name
      "Name"
    end
  end

  def test_cant_instantiate_modules
    begin
      Nameable.new
    rescue NoMethodError => e
      assert_equal NoMethodError, e.class
      assert_match(/undefined method `new'/, e.message)
    end
  end

  # ------------------------------------------------------------------

  module Nameable
    def name
      "Name"
    end
  end

  class Person
    include Nameable
  end

  def test_can_instantiate_classes_that_include_modules
    person = Person.new
    assert_equal "Name", person.name
  end

  # ------------------------------------------------------------------

  module Nameable
    def name
      "Name"
    end
  end

  class Dog
    include Nameable
  end

  def test_classes_can_use_methods_from_included_modules
    fido = Dog.new
    assert_equal "Name", fido.name
  end

  # ------------------------------------------------------------------

  module Walkable
    def walk
      "Walking"
    end
  end

  class Person
    include Nameable
    include Walkable
  end

  def test_classes_can_include_multiple_modules
    person = Person.new
    assert_equal "Name", person.name
    assert_equal "Walking", person.walk
  end

  # ------------------------------------------------------------------

  module Nameable
    def name
      "Name"
    end
  end

  def test_including_modules_gives_access_to_instance_methods
    class Dog
      include Nameable
    end
    fido = Dog.new
    assert_equal "Name", fido.name
  end

  def test_modules_can_be_nestled_inside_other_modules
    module Outer
      module Inner
        def inner_method
          "Inner Method"
        end
      end

      def outer_method
        "Outer Method"
      end
    end

    class NestedClass
      include Outer
      include Outer::Inner
    end

    nested = NestedClass.new
    assert_equal "Outer Method", nested.outer_method
    assert_equal "Inner Method", nested.inner_method
  end

  # ------------------------------------------------------------------

  module TableManagement
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def table_name
        "table_name"
      end
    end

    def table_data
      "table_data"
    end
  end

  class Table
    include TableManagement
  end

  def test_modules_can_define_class_methods
    assert_equal "table_name", Table.table_name
    assert_equal "table_data", Table.new.table_data
  end
end
