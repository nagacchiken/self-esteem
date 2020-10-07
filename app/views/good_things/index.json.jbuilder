

json.array!(@good_things) do |event|
  json.extract! event, :good_1, :good_2,:good_3
  json.start event.start_date
  json.end event.start_date
  
end