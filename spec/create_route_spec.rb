require 'spec_helper'
require 'route'

describe Route do
  it "creates a new route" do
    r = Route.new('ab', 7)
    expect(r.path).to eq 'ab'
    expect(r.distance).to eq 7
  end
end
