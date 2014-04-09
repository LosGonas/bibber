class Reference
  # mixins
  include MongoMapper::Document

  # consts
  TYPES = {
    article: {
      desc: "An article from a journal or magazine.",
      required: [:author, :title, :journal, :year],
      optional: [:volume, :number, :pages, :month, :note, :key]
    },
    book: {
      desc: "A book with an explicit publisher.",
      required: [:author, :editor, :title, :publisher, :year], # author OR editor required
      optional: [:volume, :number, :series, :address, :edition, :month, :note, :key]
    },
    inproceeding: {
      desc: "An article in a conference proceedings.",
      required: [:author, :title, :booktitle, :year],
      optional: [:editor, :volume, :series, :pages, :address, :month, :organization, :publisher, :note, :key]
  }}

  # keys
  key :entry_type, String
  key :entries, Hash

  # validations
  validates :entry_type, presence: true

  def to_bib(id="KB04")
    "@#{entry_type} {#{id},\n#{entries.map {|x|"  #{x[0]} = \"#{x[1]}\""}.join(",\n")}\n}"
  end

  # custom validations
  validate do |this|
    # REMEMBAH: this implies _every_ required field has to be present
    et = this.entry_type.to_sym
    TYPES[et][:required].each do |field|
      if entries[field].blank?
        errors.add(field, "cannot be empty")
      end
    end
  end

  # rels
  belongs_to :user

  def get(field)
    TYPES[entry_type.to_sym][field.to_sym]
  end


  def as_file
    to_bib
  end
  
  class << self
    def entry_types
      TYPES.keys.map { |k| k.to_s.pluralize }
    end
  end
end

