require_relative '../../../app/models/role'

RSpec.describe Role do
  describe 'model' do
    it { should respond_to( :is_user?) }
    it { should respond_to( :is_revisor?) }
    it { should respond_to( :is_admin?) }
  end

  describe 'initialize' do
    it 'should have default role set to user' do
      expect(Role.new.is_user?).to eq true
    end

    it 'should is_user if initialized with :user' do
      expect(Role.new(:user).is_user?).to eq true
    end


    it 'should is_revisor if initialized with :revisor' do
      expect(Role.new(:revisor).is_revisor?).to eq true
    end

    it 'should not be revisor if initialized with :user' do
      expect(Role.new(:user).is_revisor?).to eq false
    end

    it 'should not be revisor if initialized with :admin' do
      expect(Role.new(:user).is_revisor?).to eq false
    end


    it 'should is_admin if initialized with :admin' do
      expect(Role.new(:admin).is_admin?).to eq true
    end

    it 'should not be admin if initialized with :user' do
      expect(Role.new(:user).is_admin?).to eq false
    end

    it 'should not be admin if initialized with :revisor' do
      expect(Role.new(:revisor).is_admin?).to eq false
    end
  end

end