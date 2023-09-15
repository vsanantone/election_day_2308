require './lib/race'
require './lib/candidate'
    
RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")    
  end

  it "exist" do
    expect(@race).to be_a(Race)
  end

  it "has an office and no candidates" do
    expect(@race.office).to eq("Texas Governor")
    expect(@race.candidates).to eq([])
  end

  it "registers a candidate and returns a candidate object" do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    expect(candidate1).to be_a(Candidate)
    expect(candidate1.class).to eq(Candidate)
    expect(candidate1.name).to eq("Diana D")
    expect(candidate1.party).to eq(:democrat)
    expect(@race.candidates).to eq([candidate1, candidate2])
  end 
  
end