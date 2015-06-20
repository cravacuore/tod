require 'data_mapper'
require_relative '../mappers/opinion_mapper'
require_relative 'evaluation_opinion'

class Evaluation
  include DataMapper::Resource

  # property <name>, <type>
  property :id,          Serial
  property :evaluator,   String, required: true, :length => 3..50
  property :comment,     Text,   required: true, :length => 1..500
  property :opinion,     EvaluationOpinionMapper, :default  => EvaluationOpinion.new
  belongs_to :proposal

  validates_with_method :words_enough?

  def words_enough?(min_size = 3)
   self.comment.split.size >= min_size
  end

  def to_paragraph
    "#{self.opinion}: #{self.comment}"
  end

end
