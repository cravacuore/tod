class ProposalSessionType

  def initialize(type_name=:presentation)
    @type = type_name
  end

  def is_workshop?
    @type.equal? :workshop
  end

  def is_presentation?
    @type.equal? :presentation
  end

  def to_s
    @type.to_s
  end

end