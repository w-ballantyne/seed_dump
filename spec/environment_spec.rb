require 'spec_helper'

describe SeedDumpCitus do
  describe '.dump_using_environment' do
    before(:all) do
      create_db
    end

    before(:each) do
      Rails.application.eager_load!

      FactoryBot.create(:sample)
    end

    describe 'APPEND' do
      it "should specify append as true if the APPEND env var is 'true'" do
        SeedDumpCitus.should_receive(:dump).with(anything, include(append: true))

        SeedDumpCitus.dump_using_environment('APPEND' => 'true')
      end

      it "should specify append as true if the APPEND env var is 'TRUE'" do
        SeedDumpCitus.should_receive(:dump).with(anything, include(append: true))

        SeedDumpCitus.dump_using_environment('APPEND' => 'TRUE')
      end

      it "should specify append as false the first time if the APPEND env var is not 'true' (and true after that)" do
        FactoryBot.create(:another_sample)

        SeedDumpCitus.should_receive(:dump).with(anything, include(append: false)).ordered
        SeedDumpCitus.should_receive(:dump).with(anything, include(append: true)).ordered

        SeedDumpCitus.dump_using_environment('APPEND' => 'false')
      end
    end

    describe 'BATCH_SIZE' do
      it 'should pass along the specified batch size' do
        SeedDumpCitus.should_receive(:dump).with(anything, include(batch_size: 17))

        SeedDumpCitus.dump_using_environment('BATCH_SIZE' => '17')
      end

      it 'should pass along a nil batch size if BATCH_SIZE is not specified' do
        SeedDumpCitus.should_receive(:dump).with(anything, include(batch_size: nil))

        SeedDumpCitus.dump_using_environment
      end
    end

    describe 'EXCLUDE' do
      it 'should pass along any attributes to be excluded' do
        SeedDumpCitus.should_receive(:dump).with(anything, include(exclude: [:baggins, :saggins]))

        SeedDumpCitus.dump_using_environment('EXCLUDE' => 'baggins,saggins')
      end
    end

    describe 'FILE' do
      it 'should pass the FILE parameter to the dump method correctly' do
        SeedDumpCitus.should_receive(:dump).with(anything, include(file: 'blargle'))

        SeedDumpCitus.dump_using_environment('FILE' => 'blargle')
      end

      it 'should pass db/seeds.rb as the file parameter if no FILE is specified' do
        SeedDumpCitus.should_receive(:dump).with(anything, include(file: 'db/seeds.rb'))

        SeedDumpCitus.dump_using_environment
      end
    end

    describe 'LIMIT' do
      it 'should apply the specified limit to the records' do
        relation_double = double('ActiveRecord relation double')
        Sample.should_receive(:limit).with(5).and_return(relation_double)

        SeedDumpCitus.should_receive(:dump).with(relation_double, anything)
        SeedDumpCitus.stub(:dump)

        SeedDumpCitus.dump_using_environment('LIMIT' => '5')
      end
    end

    ['', 'S'].each do |model_suffix|
      model_env = 'MODEL' + model_suffix

      describe model_env do
        context "if #{model_env} is not specified" do
          it "should dump all non-empty models" do
            FactoryBot.create(:another_sample)

            [Sample, AnotherSample].each do |model|
              SeedDumpCitus.should_receive(:dump).with(model, anything)
            end

            SeedDumpCitus.dump_using_environment
          end
        end

        context "if #{model_env} is specified" do
          it "should dump only the specified model" do
            FactoryBot.create(:another_sample)

            SeedDumpCitus.should_receive(:dump).with(Sample, anything)

            SeedDumpCitus.dump_using_environment(model_env => 'Sample')
          end

          it "should not dump empty models" do
            SeedDumpCitus.should_not_receive(:dump).with(EmptyModel, anything)

            SeedDumpCitus.dump_using_environment(model_env => 'EmptyModel, Sample')
          end
        end
      end
    end

    describe "MODELS_EXCLUDE" do
      it "should dump all non-empty models except the specified models" do
        FactoryBot.create(:another_sample)

        SeedDumpCitus.should_receive(:dump).with(Sample, anything)

        SeedDumpCitus.dump_using_environment('MODELS_EXCLUDE' => 'AnotherSample')
      end
    end

    it 'should run ok without ActiveRecord::SchemaMigration being set (needed for Rails Engines)' do
      schema_migration = ActiveRecord::SchemaMigration

      ActiveRecord.send(:remove_const, :SchemaMigration)

      SeedDumpCitus.stub(:dump)

      begin
        SeedDumpCitus.dump_using_environment
      ensure
        ActiveRecord.const_set(:SchemaMigration, schema_migration)
      end
    end
   end
 end
