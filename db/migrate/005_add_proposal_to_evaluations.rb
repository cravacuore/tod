migration 5, :add_proposal_to_evaluations do
  up do
    modify_table :evaluations do
      add_column :proposal_id, Integer
    end
  end

  down do
    drop_table :evaluations
  end
end
