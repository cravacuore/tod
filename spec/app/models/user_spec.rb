require_relative '../../../app/models/user'

RSpec.describe User do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :name) }
    it { should respond_to( :email) }
    it { should respond_to( :role) }
    it { should respond_to( :uid) }
    it { should respond_to( :provider) }
  end

  describe 'initialize' do
    it 'should have default role set to user' do
      expect(User.new.role.is_user?).to eq true
    end
  end

end
