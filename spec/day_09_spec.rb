require "day_09"

Day09 = Arihunta::AdventOfCode2020::Day09

describe Day09 do
  it "01-00" do
    expect(Day09._01("data/09-00", 5)).to eql(127)
  end

  it "01" do
    expect(Day09._01("data/09", 25)).to eql(756008079)
  end

  it "02-00" do
    expect(Day09._02("data/09-00", 5)).to eql(62)
  end

  it "02" do
    expect(Day09._02("data/09", 25)).to eql(93727241)
  end
end
