# This will guess the User class
FactoryGirl.define do

  factory :article, class: Reference do
    author "dummy"
    title  "test"
    journal "ok"
    year "2010"

  end

  factory :book, class: Reference do
    author "John"
    editor "Paul"
    title "Stan"
    publisher "Han"
    year "2000"

  end

  factory :inproceedings, class: Reference do
    author "John"
    title  "Doe"
    booktitle "Poe"
    year "1990"
  end

end