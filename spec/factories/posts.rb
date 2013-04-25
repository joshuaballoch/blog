FactoryGirl.define do
  factory :post do
    title {Randgen.word}
    body {Randgen.sentence}
    #user
  end
end
