class GoodThing < ApplicationRecord
  

  belongs_to :user
  with_options presence: true do
   validates :start_date
   validates :good_1
   validates :good_2
   validates :good_3
  end
end
