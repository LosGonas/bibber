class User
  # mixins
  include MongoMapper::Document

  # keys
  key :username, String
  key :password, String

  def authenticate(plain)
    password == plain
  end
end
