require './lib/election'
require './lib/race'
require './lib/candidate'
    
RSpec.describe Election do
  before(:each) do
    @election = Election.new("2024")
    @race = Race.new("Texas Governor")
    @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
  end

  it "exist" do
    expect(@election).to be_a(Election)
  end

  it "has a year" do
    expect(@election.year).to eq("2024")
  end

  it "has empty race objects by default" do
    expect(@election.races).to eq([])
  end

  it "can add a  race object" do
    expect(@election.add_race(@race) ).to eq([@race])
  end

  it "returns an array of all `Candidate` objects in the election." do
    expect(@election.candidates).to eq([@candidate1, @candidate2])
  end

  it "returns a hash with candidate's name and their count of votes." do
    expect(@election.vote_counts ).to eq({@candidate1 => ,@candidate2 =>})
  end
 

end
