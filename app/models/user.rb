require 'data_mapper'
require_relative '../mappers/role_mapper'
require_relative 'role'

class User
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :email, String
  property :role, RoleMapper, :default  => Role.new
  property :uid, String
  property :provider, String

  def self.find_uid(uid)
    User.first(:uid => uid)
  end

  def self.new_from_omniauth(omniauth)
    user          = User.new
    user.uid      = omniauth["uid"]
    user.name     = omniauth["info"]["nickname"]
    user.email    = omniauth["info"]["email"]
    user.provider = 'github'
    user.save!
    user
  end

  def self.new_user(email)
    user       = User.new
    user.email = email
    user.save!
    user
  end

  def set_admin
    self.update!(:role => Role.new(:admin) )
  end

end

