require './lib/candidate'

RSpec.describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  it "exist" do
    expect(@diana).to be_a(Candidate)
  end

  it "has a name, party and vote count" do
    expect(@diana.name).to eq("Diana D")
    expect(@diana.party).to eq(:democrat)
    expect(@diana.votes).to eq(0)
  end
  
  it "can vote and keep tally of votes" do
    expect(@diana.votes).to eq(0)
    3.times { @diana.vote_for! }
    expect(@diana.votes).to eq(3)
    @diana.vote_for!
    expect(@diana.votes).to eq(4)
  end

end
