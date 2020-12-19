require "day_14"

Day14 = Arihunta::AdventOfCode2020::Day14

describe Day14 do
  it "01-00" do
    expect(Day14._01("data/14-00")).to eql(165)
  end

  it "01" do
    expect(Day14._01("data/14")).to eql(11327140210986)
  end

  it "02-00" do
    expect(Day14._02("data/14-01")).to eql(208)
  end

  it "02" do
    expect(Day14._02("data/14")).to eql(2308180581795)
  end
end
