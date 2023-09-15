class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(data)
    @candidates << candidate1 = Candidate.new(data)
    candidate1
  end

end