require 'rubygems'
require 'dm-core'
require 'dm-tags'
require_relative '../mappers/proposal_session_type_mapper'
require_relative '../mappers/audience_mapper'
require_relative '../models/audience'

class Proposal
  include DataMapper::Resource

  # property <name>, <type>
  property :id,          Serial
  property :title,       String, required: true, :length => 3..50
  property :description, Text,   required: true, :length => 1..500
  property :author,      String, required: true, :length => 3..50
  property :email,       String, required: true, :format => :email_address
  property :type,        ProposalSessionTypeMapper, :default  => ProposalSessionType.new(:presentation)
  property :audience,    AudienceMapper, :default  => Audience.new(:initial)
  property :date,        DateTime
  has n,   :comments
  has n,   :evaluations
  has_tags_on :tags

  def same_title?(a_proposal)
    self.title.eql? a_proposal.title
  end

  def append_author_to_title
    self.title += (" - " + @author)
  end

  def set_session(session)
    self.update!(:type => ProposalSessionType.new(session) )
  end

  def set_audience(audience)
    self.update!(:audience => Audience.new(audience) )
  end

  def evaluated_by?(username)
    self.evaluations.any? do |evaluation|
      evaluation.evaluator == username
    end
  end
end
