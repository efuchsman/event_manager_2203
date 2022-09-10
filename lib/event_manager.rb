# ./lib/event_manager.rb
# require "csv"
puts "EventManager initialized."

##   Read entire file

# contents = File.read "event_attendees.csv"

# puts contents

##   Read file line by line

# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   puts line
# end

##  Convert to array

  # lines = File.readlines "event_attendees.csv"
  # lines.each do |line|
  #   columns = line.split(",")
  #   p columns
  # end

##  Read first names

#   lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

##  Skip the header row

# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   next if line == "
#   ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

## Same as above except this one actually works....

lines = File.readlines "event_attendees.csv"
row_index = 0
lines.each do |line|
  row_index = row_index + 1
  next if row_index == 1
  columns = line.split(",")
  name = columns[2]
  puts name
end
