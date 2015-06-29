migration 7, :add_audience_to_proposal do
  up do
    modify_table(:proposals) do
      add_column :audience, DataMapper::Property::AudienceMapper
    end
  end

  down do
    drop_table :proposals
  end
end