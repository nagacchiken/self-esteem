class CreateGoodThings < ActiveRecord::Migration[6.0]
  def change
    create_table :good_things do |t|
      t.string     :good_1,     null: false
      t.string     :good_2,     null: false
      t.string     :good_3,     null: false
      t.datetime   :start_date, null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
