class User
  # mixins
  include MongoMapper::Document

  # keys
  key :username, String, :unique => true, :required => true
  key :password, String, :required => true

  # rels
  many :references

  def authenticate(plain)
    password == plain
  end
end

