class EvaluationOpinion

  def initialize(opinion=:weakly_agreed)
    @opinion = opinion
  end

  def is_strongly_agreed?
    @opinion.equal? :strongly_agreed
  end

  def is_weakly_agreed?
    @opinion.equal? :weakly_agreed
  end

  def is_strongly_rejected?
    @opinion.equal? :strongly_rejected
  end

  def is_weakly_rejected?
    @opinion.equal? :weakly_rejected
  end

  def to_s
    @opinion.to_s
  end

end