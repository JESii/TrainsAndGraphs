require 'spec_helper'
require 'route'

puts '===========Route Specs========='
describe Route do
  it "creates a new route" do
    r = Route.new('ab', 7)
    expect(r.path.to_s).to eq 'ab'
    expect(r.distance).to eq 7
  end
  it "uses the Path class to create a path" do
    r = Route.new('ab',7)
    expect(r.path).to be_a Path
  end
  it "returns the first node in a pathn" do
    r = Route.new('ab',7)
    expect(r.path.first).to eq 'a'
  end
  it "returns the last node in a path" do
    r = Route.new('ab', 7)
    expect(r.path.last).to eq 'b'
  end
  it "supports character access" do
    r = Route.new('abcde',25)
    expect(r.path[0]).to eq 'a'
  end
  it "returns the correct path size" do
    r = Route.new('abc',7)
    expect(r.path.size).to eq 3
  end
end
