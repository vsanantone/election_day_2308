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
    candidates = []
    @races.each do |race|
      candidates << race.candidates
    end
     candidates.flatten  
  end
  
  def vote_counts
    candidate_voting_record = Hash.new(0)
    candidates.map do |candidate|
      candidate_voting_record[candidate.name] = candidate.votes
    end
  candidate_voting_record
  end

end




def candidates
  all_candidates = @races.flat_map do |race|
    race.candidates
  end
end