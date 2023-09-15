class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    candies = []
    @race.candidates.each do |candidate|
      candies << candidate
    end
    candies
  end

  def vote_counts
    candidate_voting_record = Hash.new(0)
    
    candidate_voting_record
  end

end