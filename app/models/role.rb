class Role

  def initialize(rolename=:user)
    @rolename = rolename
  end

  def is_user?
    @rolename.equal? :user
  end

  def is_revisor?
    @rolename.equal? :revisor
  end

  def is_admin?
    @rolename.equal? :admin
  end

  def to_s
    @rolename.to_s
  end

  def is(sym)
    @rolename.equal? sym
  end
end
