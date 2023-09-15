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
    candidatea = @race.register_candidate!({name: "Diana D", party: :democrat})
    candidateb = @race.register_candidate!({name: "Roberto R", party: :republican})
    expect(candidatea).to be_a(Candidate)
    expect(candidatea.class).to eq(Candidate)
    expect(candidatea.name).to eq("Diana D")
    expect(candidatea.party).to eq(:democrat)
    expect(@race.candidates).to eq([candidatea, candidateb])
  end 

end