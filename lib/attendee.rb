
class Attendee
attr_reader :id, :name, :zipcode


  def initialize(id, first_name, last_name, zipcode)
    @id = id
    @first_name = first_name
    @last_name = last_name
    # @name = "#{first_name} #{last_name}"
    @zipcode = zipcode.to_s.rjust(5, "0")[0..4]
  end


end
