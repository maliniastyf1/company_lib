FactoryGirl.define do
  factory :book do
    author "Bonda Katarzyna"
    title "Bonda"
    description "Detective Story"
    status "Available"
    user
  end
  factory :second_book, class: "Book" do
    author "Katarzyna"
    title "Caryca"
    description "Romantic Story"
    status "Available"
    user
  end
end
