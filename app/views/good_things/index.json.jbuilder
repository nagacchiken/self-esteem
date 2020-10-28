json.array! @good_things, partial: 'good_things/index', as: :good_thing

json.array!(@good_things) do |event|
  json.extract! event, :id, :good_1, :good_2, :good_3
  json.start event.start_date
  json.end event.start_date
  json.title '投稿を見る'
  json.url good_thing_url(event, format: :html)
end
