require "day_12"

Day12 = Arihunta::AdventOfCode2020::Day12

describe Day12 do
  it "01-00" do
    expect(Day12._01("data/12-00")).to eql(25)
  end

  it "01" do
    expect(Day12._01("data/12")).to eql(590)
  end

  it "02-00" do
    expect(Day12._02("data/12-00")).to eql(286)
  end

  it "02" do
    expect(Day12._02("data/12")).to eql(42013)
  end
end
