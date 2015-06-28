migration 4, :create_evaluations do
  up do
    create_table :evaluations do
      column :id,        Integer,                                       :serial => true
      column :evaluator, DataMapper::Property::String,                  :length => 255
      column :comment,   DataMapper::Property::Text
      column :opinion,   DataMapper::Property::EvaluationOpinionMapper, :length => 255
    end
  end

  down do
    drop_table :evaluations
  end
end
