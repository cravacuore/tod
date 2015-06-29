require_relative '../../../app/models/proposal'

describe Proposal do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :title) }
    it { should respond_to( :description) }
    it { should respond_to( :author) }
    it { should respond_to( :date) }
    it { should respond_to( :comments) }
    it { should respond_to( :tags) }
    it { should respond_to( :evaluations) }
    it { should respond_to( :visits) }
  end

  describe 'initialize' do
    it 'should create a proposal' do
      rigth_now = Time.now.to_date

      proposal = Proposal.new
      proposal.title = 'A title'
      proposal.description = 'A description'
      proposal.author = 'Hache'
      proposal.date = rigth_now

      expect(proposal.title).to eq 'A title'
      expect(proposal.description).to eq 'A description'
      expect(proposal.author).to eq 'Hache'
      expect(proposal.date).to eql rigth_now
    end

    it 'should have default session set to presentation' do
      expect(Proposal.new.type.is_presentation?).to eq true
    end

    # TODO - to validate
    # it 'should raise an error when title is "as"' do
    #   proposal = Proposal.new
    #   proposal.title = 'as'
    #   proposal.description = 'A description'
    #   proposal.author = 'Hache'
    #   # expect { }.to raise_error
    # end

    # it 'should raise an error when description is empty' do
    #   proposal = Proposal.new
    #   proposal.title = 'A title'
    #   proposal.description = ''
    #   proposal.author = 'Hache'
    #   # expect { }.to raise_error
    # end

    # it 'should raise an error when author is "h"' do
    #   proposal = Proposal.new
    #   proposal.title = 'A title'
    #   proposal.description = 'A description'
    #   proposal.author = 'h'
    #   # expect { }.to raise_error
    # end
  end

  describe 'same_title' do
    it 'should be true' do
      proposal1 = Proposal.new
      proposal1.title = 'A title'
      proposal1.description = 'A description1'
      proposal1.author = 'An author1'

      proposal2 = Proposal.new
      proposal2.title = 'A title'
      proposal2.description = 'A description2'
      proposal2.author = 'An author2'

      expect(proposal1.same_title?(proposal2)).to eq true
    end

    it 'should be false' do
      proposal1 = Proposal.new
      proposal1.title = 'A title1'
      proposal1.description = 'A description1'
      proposal1.author = 'An author1'

      proposal2 = Proposal.new
      proposal2.title = 'A title'
      proposal2.description = 'A description2'
      proposal2.author = 'An author2'

      expect(proposal1.same_title?(proposal2)).to eq false
    end
  end

  describe 'append_author_to_title' do
    it 'should have the title "A title - An author" when the title is "A title"
        and author is "An author"' do
      proposal = Proposal.new
      proposal.title = 'A title'
      proposal.description = 'A description'
      proposal.author = 'An author'
      proposal.append_author_to_title
      expect(proposal.title).to eq 'A title - An author'
    end
  end

end

