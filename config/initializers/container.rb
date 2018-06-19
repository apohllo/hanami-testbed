require 'dry/system/container'
require 'rom/sql'

module Testbed
  class Container < Dry::System::Container
    configure do |config|
      config.root = Pathname(__dir__).realpath.join("../../")
    end

    register('testbed.root', Pathname(__dir__).realpath.join("../../"))

    register('testbed.rom', memoize: true) {
      ROM.container(:sql, ENV['DATABASE_URL']) do |rom_config|
        rom_config.auto_registration(self['testbed.root'].join("lib/testbed").to_s)
      end
    }
  end
end

module Testbed
  Import = Container.injector
end
