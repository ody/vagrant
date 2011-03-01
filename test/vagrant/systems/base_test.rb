require "test_helper"

class BaseSystemTest < Test::Unit::TestCase
  setup do
    @klass = Vagrant::Systems::Base

    @vm = mock("vm")
    @instance = @klass.new(@vm)
  end

  should "provide access to the VM" do
    assert_equal @vm, @instance.vm
  end

  should "error on preparing host only network" do
    assert_raises(@klass::BaseError) { @instance.prepare_host_only_network }
  end

  context "registering systems" do
    teardown do
      @klass.registered.delete(:zomg)
    end

    should "not have unregistered provisioners" do
      assert_nil @klass.registered[:zomg]
    end

    should "be able to register a provisioner" do
      foo = Class.new(@klass) do
        register :zomg
      end

      assert_equal foo, @klass.registered[:zomg]
    end
  end
end
