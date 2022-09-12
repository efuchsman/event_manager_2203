require 'csv'
require "./lib/attendee.rb"

class EventManager
attr_reader :attendees
  def initialize
    @attendees = []
  end




  contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
  puts "EventManager initialized."


  # def clean_zipcode(zipcode)
  #   zipcode.to_s.rjust(5, "0")[0..4]
  # end


    contents.each do |row|
    id = row[:id]
    f_name = row[:first_name]
    l_name = row[:last_name]
    zipcode = (row[:zipcode]).to_s.rjust(5, "0")[0..4]
    attendee = id + ", " "'#{f_name}'"  + ", "  "'#{l_name}'" + ", " "'#{zipcode}'"
    p attendee
    end






end

