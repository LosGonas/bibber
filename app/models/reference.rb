class Reference
  # mixins
  include MongoMapper::Document
  belongs_to :user

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
    inproceedings: {
      desc: "An article in a conference proceedings.",
      required: [:author, :title, :booktitle, :year],
      optional: [:editor, :volume, :series, :pages, :address, :month, :organization, :publisher, :note, :key]
  }}

  # keys
  key :entry_type, String
  key :entries, Hash
  key :bib_id, String
  key :searchOptimization #see searchOptimize

  # validations
  validates :entry_type, presence: true

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


  def createID
    if( entries["key"].blank? ) then
      str = ""
      authors = self.entries["author"].split(" ").each {|w| str += w.first}
      str += self.entries["year"].last(2)
      self.bib_id = str
    else
      self.bib_id = entries["key"]
    end
  end

  #create searchOptimization for MongoDB text search. Should contain all data desired in the search.
  ### !!!!!!
  ### Add Tags to searchOptimization so no changes to search_controller, search view needed ?
  ### !!!!!!
  def searchOptimize
    self.searchOptimization = self.entries.reject{|key, val| val.blank?}.map{|k, v| "#{v}"}.join(" ")
  end


  def to_bib(id=self.bib_id)
    #first row
    str = "@#{entry_type} {#{id},\n"

    #reject blank fields
    fields = entries.reject {|key, val| val.blank?}

    #entries + last row
    str += "#{fields.map {|key, val|"  #{key} = \"#{val}\""}.join(",\n")}\n}"
  end


  def specialChars(bib)
    conversions = {"ä" => '\"{a}',
         "Ä" => '\"{A}',
         "ö" => '\"{o}',
         "Ö" => '\"{O}',
         "å" => '\r{a}',
         "Å" => '\r{A}'
    }
    #check all chars, replace as described in above conversions
    bib.gsub(/./) {|m| conversions.fetch(m,m)}
  end


  # rels

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

