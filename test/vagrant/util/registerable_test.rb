require "test_helper"

class RegisterableUtilTest < Test::Unit::TestCase
  setup do
    @klass = Class.new do
      include Vagrant::Util::Registerable
    end
  end

  should "not have anything registered initially" do
    assert @klass.registered.empty?
  end

  should "register a given subclass" do
    subclass = Class.new(@klass) do
      register :foo
    end

    assert_equal subclass, @klass.registered[:foo]
  end
end
