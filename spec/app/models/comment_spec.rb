require 'rspec'

require_relative '../../../app/models/comment'

describe Comment do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :author) }
    it { should respond_to( :body) }
    it { should respond_to( :date) }
  end

  describe 'initialize' do
    it 'should create a comment' do

      rigth_now = Time.now

      comment = Comment.new
      comment.author = 'Hachedeeme'
      comment.body = 'Body'
      comment.date = rigth_now

      comment.author.should eq "Hachedeeme"
      comment.body.should eq "Body"
      comment.date.should eql? rigth_now
  	end
  end

end
