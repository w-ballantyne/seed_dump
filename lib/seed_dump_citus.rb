require 'ipaddr'
require 'seed_dump_citus/dump_methods/enumeration'
require 'seed_dump_citus/dump_methods'
require 'seed_dump_citus/environment'

class SeedDumpCitus
  extend Environment
  extend DumpMethods

  require 'seed_dump_citus/railtie' if defined?(Rails)
end
