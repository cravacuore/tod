migration 4, :create_conferences do
  up do
    create_table :conferences do
      column :id, Integer, :serial => true
      column :reviews_per_proposal, DataMapper::Property::Numeric, :default => 3
    end
  end

  down do
    drop_table :conferences
  end
end