migration 9, :create_user do
  up do
    create_table :users do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String,      :length => 255
      column :email, DataMapper::Property::String,     :length => 255
      column :role, DataMapper::Property::RoleMapper
      column :uid, DataMapper::Property::String,       :length => 255
      column :provider, DataMapper::Property::String,  :length => 255
    end
  end

  down do
    drop_table :users
  end
end
