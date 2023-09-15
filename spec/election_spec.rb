require './lib/election'
require './lib/race'
require './lib/candidate'
    
RSpec.describe Election do
  before(:each) do
    @election = Election.new("2024")
    @race = Race.new("Texas Governor")
    @race2 = Race.new("Texas Senator")

    @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
  
    @candidate3 = @race2.register_candidate!({name: "Lou V", party: :democrat})
    @candidate4 = @race2.register_candidate!({name: "Shawn Q", party: :republican})
  
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
  
  it "can add a race object" do
    expect(@election.races).to eq([])
    expect(@election.add_race(@race)).to eq([@race])
    expect(@election.add_race(@race2)).to eq([@race, @race2])
    expect(@election.races).to eq([@race, @race2])
  end

  it "returns a list  of all candidate objects" do
    @election.add_race(@race)
    @election.add_race(@race2)
    expect(@election.candidates).to eq([@candidate1, @candidate2, @candidate3, @candidate4])
  end
  
  
  
  it "returns a hash with candidate's name and their count of votes." do
    3.times { @candidate1.vote_for! }
    4.times { @candidate2.vote_for! }
    5.times { @candidate3.vote_for! }
    2.times { @candidate4.vote_for! }
    
    @election.add_race(@race)
    @election.add_race(@race2)

    expect(@election.vote_counts).to eq({"Diana D" => 3 ,"Roberto R" => 4, "Lou V" => 5 ,"Shawn Q" => 2})
  end
 

end




# it "returns an array of all `Candidate` objects in the election." do
#   @election.add_race(@race)
#   @election.add_race(@race2)

#   expect(@election.candidates).to eq([@candidate1, @candidate2, @candidate3, @candidate4])
# end