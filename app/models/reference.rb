class Reference
  include MongoMapper::EmbeddedDocument

  key :entry_type, String
  key :entries, Hash

end