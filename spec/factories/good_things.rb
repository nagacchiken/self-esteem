FactoryBot.define do
  factory :good_thing do
    good_1 { 'aaa' }
    good_2 { 'aaa' }
    good_3 { 'aaa' }
    start_date { '2020-09-11' }
    association :user
  end
end
