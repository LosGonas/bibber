class User
  # mixins
  include MongoMapper::Document

  # keys
  key :username, String
  key :password, String

  # rels
  many :references

  def authenticate(plain)
    password == plain
  end
end

