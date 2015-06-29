require 'data_mapper'

class Conference
  include DataMapper::Resource

  property :id,                    Serial
  property :reviews_per_proposal,  Numeric, required: true, :default => 3

end