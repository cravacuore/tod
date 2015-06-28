class AdminManager
  include Singleton
  attr_accessor :admin_name, :admin_email

  def self.set_as_admin_if_eligible(some_user)
    logger.debug "LOGGED #{some_user} with email #{some_user.email} where is_admin= #{is_admin(some_user)}"
    if is_admin(some_user)
      some_user.set_admin
      logger.debug "USER #{some_user.name} is now ADMIN"
    end
  end

  def self.is_admin(some_user)
    some_user && (AdminManager.instance.admin_name == some_user.name || AdminManager.instance.admin_email == some_user.email)
  end

  def self.set_admin_email(email)
    AdminManager.instance.admin_email = email
  end

  def self.set_admin_name(name)
    AdminManager.instance.admin_name = name
  end

end
