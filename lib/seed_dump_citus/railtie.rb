class SeedDumpCitus
  class Railtie < Rails::Railtie

    rake_tasks do
      load "tasks/seed_dump_citus.rake"
    end

  end
end
