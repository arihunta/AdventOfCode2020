require "day_04"

Day04 = Arihunta::AdventOfCode2020::Day04

describe Day04 do
  it "01-00" do
    expect(Day04._01("data/04-00")).to eql(2)
  end

  it "01" do
    expect(Day04._01("data/04")).to eql(170)
  end

  it "02-00" do
    expect(Day04._02("data/04-01")).to eql(4)
  end

  it "02" do
    expect(Day04._02("data/04")).to eql(103)
  end
end
