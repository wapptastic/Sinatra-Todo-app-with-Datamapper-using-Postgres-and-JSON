class Todo
  include DataMapper::Resource  
  property :id,           Serial,	key: true, unique_index: true
  property :content,      String,	required: true, length: 1..255
  property :done,         Boolean,  :default => false, required: true
  property :completed_at, DateTime
  property :created_at,   DateTime
  property :updated_at,   DateTime
end