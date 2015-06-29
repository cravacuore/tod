migration 10, :proposal_frozen_tag do
  up do
    modify_table(:proposals) do
      add_column :frozen_tag_list, DataMapper::Property::Text
    end
  end

  down do
    drop_column :frozen_tag_list
  end
end
