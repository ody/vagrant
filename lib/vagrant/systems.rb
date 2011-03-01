# These can't be autoloaded because they have to register functionality
# with Vagrant core.
require 'vagrant/systems/base'

# The top-level OS's
require 'vagrant/systems/freebsd'
require 'vagrant/systems/linux'
require 'vagrant/systems/solaris'

# Various linux flavors
require 'vagrant/systems/debian'
require 'vagrant/systems/gentoo'
require 'vagrant/systems/redhat'
require 'vagrant/systems/ubuntu'
