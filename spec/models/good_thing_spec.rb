require 'rails_helper'

RSpec.describe GoodThing, type: :model do
  before do
    @good_thing = FactoryBot.build(:good_thing)
  end

  it '全て正しく入力されていれば登録することができること' do
    expect(@good_thing).to be_valid
  end

  it 'good_1が空では登録できないこと' do
    @good_thing.good_1 = nil
    @good_thing.valid?
    expect(@good_thing.errors.full_messages).to include("Good 1 can't be blank")
  end

  it 'good_2が空では登録できないこと' do
    @good_thing.good_2 = nil
    @good_thing.valid?
    expect(@good_thing.errors.full_messages).to include("Good 2 can't be blank")
  end

  it 'good_3が空では登録できないこと' do
    @good_thing.good_3 = nil
    @good_thing.valid?
    expect(@good_thing.errors.full_messages).to include("Good 3 can't be blank")
  end

  it 'start_dateが空では登録できないこと' do
    @good_thing.start_date = nil
    @good_thing.valid?
    expect(@good_thing.errors.full_messages).to include("Start date can't be blank")
  end

  it '重複したstart_dateが存在する場合登録できないこと' do
    @good_thing.save
    another_good_thing = FactoryBot.build(:good_thing, start_date: @good_thing.start_date)
    another_good_thing.valid?
    expect(another_good_thing.errors.full_messages).to include('Start date has already been taken')
  end
end
