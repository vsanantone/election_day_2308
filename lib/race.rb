class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(hash)
    candidate = Candidate.new(hash)
    @candidates << candidate
    candidate
  end

end