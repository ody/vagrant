module Vagrant
  module Util
    # Provides class-level `register` and `registered` functionality so
    # that subclasses can "register" themselves with parent classes and
    # can be looked up by that symbol later.
    module Registerable
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        # Registers a system with a given shortcut. This allows that system
        # to be referenced with the shortcut.
        #
        # @param [Symbol] shortcut
        def register(shortcut)
          registered[shortcut] = self
        end

        # Returns the association of shortcut to system class.
        #
        # @return [Hash]
        def registered
          # We have to do this so that the root "registerable" gets the call
          # and stores it on it's instance.
          return superclass.registered if superclass.included_modules.include?(Registerable)
          @registered ||= {}
        end
      end
    end
  end
end
