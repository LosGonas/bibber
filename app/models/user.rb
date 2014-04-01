class User
  include MongoMapper::Document

  key :username, String
  key :password, String

  many :references

end
