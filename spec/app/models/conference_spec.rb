require_relative '../../../app/models/conference'

RSpec.describe Conference do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :reviews_per_proposal) }
  end

  describe 'initialize' do
    it 'should have default reviews_per_proposal set to 3' do
      expect(Conference.new.reviews_per_proposal).to eq 3
    end
  end

end