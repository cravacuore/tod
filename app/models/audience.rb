class Audience

  def initialize(audience_name=:initial)
    @audience = audience_name
  end

  def is_initial?
    @audience.equal? :initial
  end

  def is_practicing?
    @audience.equal? :practicing
  end

  def is_advanced?
    @audience.equal? :advanced
  end

  def to_s
    @audience.to_s
  end

end