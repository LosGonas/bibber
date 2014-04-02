class Reference
  include MongoMapper::EmbeddedDocument

  key :entry_type, String
  key :entries, Hash

  def to_bib(id="KB04")
    "@#{entry_type} {#{id},\n#{entries.map {|x|"  #{x[0]} = \"#{x[1]}\""}.join(",\n")}\n}"
  end
end