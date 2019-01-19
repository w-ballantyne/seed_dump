namespace :db do
  namespace :seed  do
    namespace :citus do
      desc "Dump records from the database into db/seeds.rb"
      task :dump => :environment do

        SeedDumpCitus.dump_using_environment(ENV)
      end
    end
  end
end
