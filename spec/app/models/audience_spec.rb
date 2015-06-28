require 'rspec'
require_relative '../../../app/models/audience'


RSpec.describe Audience do
  describe 'model' do
    it { should respond_to(:is_initial?) }
    it { should respond_to(:is_practicing?) }
    it { should respond_to(:is_advanced?) }
  end

  describe 'initialize' do
    it 'should is_initial if initialized with :initial' do
      expect(Audience.new(:initial).is_initial?).to eq true
    end

    it 'should not be initial if initialized with :other' do
      expect(Audience.new(:other).is_initial?).to eq false
    end

    it 'should is_practicing if initialized with :practicing' do
      expect(Audience.new(:practicing).is_practicing?).to eq true
    end

    it 'should not be practicing if initialized with :other' do
      expect(Audience.new(:other).is_practicing?).to eq false
    end

    it 'should is_advanced if initialized with :advanced' do
      expect(Audience.new(:advanced).is_advanced?).to eq true
    end

    it 'should not be advanced if initialized with :other' do
      expect(Audience.new(:other).is_advanced?).to eq false
    end
  end

end