migration 6, :add_email_to_proposal do
  up do
    modify_table(:proposals) do
      add_column :email, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :proposals
  end
end