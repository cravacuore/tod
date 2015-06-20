require_relative '../../../app/models/evaluation'

describe Evaluation do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :evaluator) }
    it { should respond_to( :comment) }
  end

  describe 'initialize' do
    it 'should create a evaluation' do

      comment = Evaluation.new
      comment.evaluator = 'Evaluator'
      comment.comment = 'A free text comment'

      expect(comment.evaluator).to eq "Evaluator"
      expect(comment.comment).to eq "A free text comment"
    end
  end

end
