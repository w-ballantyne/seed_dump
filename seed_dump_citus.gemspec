# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: seed_dump_citus 3.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "seed_dump_citus".freeze
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rob Halff".freeze, "Ryan Oblak".freeze]
  s.date = "2018-05-08"
  s.description = "Dump (parts) of your database to db/seeds.rb to get a headstart creating a meaningful seeds.rb file".freeze
  s.email = "rroblak@gmail.com".freeze
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".rspec",
    "Gemfile",
    "MIT-LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/seed_dump_citus.rb",
    "lib/seed_dump_citus/dump_methods.rb",
    "lib/seed_dump_citus/dump_methods/enumeration.rb",
    "lib/seed_dump_citus/environment.rb",
    "lib/seed_dump_citus/railtie.rb",
    "lib/tasks/seed_dump_citus.rake",
    "seed_dump_citus.gemspec",
    "spec/dump_methods_spec.rb",
    "spec/environment_spec.rb",
    "spec/factories/another_samples.rb",
    "spec/factories/samples.rb",
    "spec/factories/yet_another_samples.rb",
    "spec/helpers.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/rroblak/seed_dump_citus".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "{Seed Dumper for Rails}".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4"])
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4"])
      s.add_development_dependency(%q<byebug>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<factory_bot>.freeze, ["~> 4.8.2"])
      s.add_development_dependency(%q<activerecord-import>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 4"])
      s.add_dependency(%q<activerecord>.freeze, [">= 4"])
      s.add_dependency(%q<byebug>.freeze, ["~> 2.0"])
      s.add_dependency(%q<factory_bot>.freeze, ["~> 4.8.2"])
      s.add_dependency(%q<activerecord-import>.freeze, ["~> 0.4"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 4"])
    s.add_dependency(%q<activerecord>.freeze, [">= 4"])
    s.add_dependency(%q<byebug>.freeze, ["~> 2.0"])
    s.add_dependency(%q<factory_bot>.freeze, ["~> 4.8.2"])
    s.add_dependency(%q<activerecord-import>.freeze, ["~> 0.4"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 2.0"])
  end
end

