class Reference
  # mixins
  include MongoMapper::Document

  # consts
  TYPES = {
    articles: {
      desc: "An article from a journal or magazine.",
      required: [:author, :title, :journal, :year],
      optional: [:volume, :number, :pages, :month, :note, :key]
    },
    books: {
      desc: "A book with an explicit publisher.",
      required: [:author, :editor, :title, :publisher, :year], # author OR editor required
      optional: [:volume, :number, :series, :address, :edition, :month, :note, :key]
  }}

  # rels
  belongs_to :user

  # keys
  key :entry_type, String
  key :entries, Hash

  def get(type, field)
    TYPES[type.to_sym][field.to_sym]
  end

  def to_bib(id="KB04")
    "@#{entry_type} {#{id},\n#{entries.map {|x|"  #{x[0]} = \"#{x[1]}\""}.join(",\n")}\n}"
  end

  class << self
    def entry_types
      TYPES.keys
    end
  end
end

