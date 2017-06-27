FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    #item.body 'and the reason why the data is the same for each instance'
    body { Forgery(:lorem_ipsum).words(5) }
  end
end
