migration 8, :add_visits_to_proposal do
  up do
    modify_table :proposals do
      add_column :visits, Integer
    end
  end

  down do
    drop_table :proposals
  end
end
