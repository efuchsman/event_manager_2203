require 'csv'
require "./lib/attendee.rb"
puts "EventManager initialized."
class EventManager
attr_reader :attendees, :filename
  def initialize
    @attendees_array = []
    fill_array
  end

  def attendees
    @attendees_array
  end



  def fill_array

    contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
    contents.each do |row|
    attendee = Attendee.new(row[:id],row[:first_name], row[:last_name],(row[:zipcode]).to_s.rjust(5, "0")[0..4])
    @attendees_array << attendee

    end

  end
end

