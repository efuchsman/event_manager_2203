# ./lib/event_manager.rb
#  require "csv"
# puts "EventManager initialized."

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

# lines = File.readlines "event_attendees.csv"
# row_index = 0
# lines.each do |line|
#   row_index = row_index + 1
#   next if row_index == 1
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end


##  Same as above but with each_with_index

# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end



##  Using CSV.open

# contents = CSV.open "event_attendees.csv", headers: true
# contents.each do |row|
#    name = row[2]
#   puts name
# end

## Accessing columns be their names

# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   puts name
# end


##   Display zip codes of all attendees

# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]
#   puts "#{name} #{zipcode}"
# end

##   Pseudocode for Cleaning Zip Codes

# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]

  # if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than 5 digits, truncate it to the first 5 digits
  # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits

#   if zipcode.length < 5
#     zipcode = zipcode.rjust 5, "0"
#   elsif zipcode.length > 5
#     zipcode = zipcode[0..4]
#   end

#   puts "#{name} #{zipcode}"
# end


## Handling Missing Zip Codes (Chris Sackett)

# if zipcode.nil?
#   zipcode = "00000"
# elsif zipcode.length < 5
#   zipcode = zipcode.rjust 5, "0"
# elsif zipcode.length > 5
#   zipcode = zipcode[0..4]
# end

# puts "#{name} #{zipcode}"
# end



## Move Clean Zip Codes to a Method

require 'csv'

# def clean_zipcode(zipcode)
#   if zipcode.nil?
#     "00000"
#   elsif zipcode.length < 5
#     zipcode.rjust(5, "0")
#   elsif zipcode.length > 5
#     zipcode[0..4]
#   else
#     zipcode
#   end
# end

# puts "EventManager intialized"

# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

# contents.each do |row|
#   name = row[:first_name]
#   zipcode = clean_zipcode(row[:zipcode])
#   puts "#{name} #{zipcode}"
# end

## Refactoring Clean Zip Codes


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

puts "EventManager intialized"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  puts "#{name} #{zipcode}"
end
