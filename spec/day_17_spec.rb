require "day_17"

Day17 = Arihunta::AdventOfCode2020::Day17

describe Day17 do
  it "01-00" do
    expect(Day17._01("data/17-00")).to eql(112)
  end

  it "01" do
    expect(Day17._01("data/17")).to eql(237)
  end

  it "02-00" do
    expect(Day17._02("data/17-00")).to eql(848)
  end

  it "02" do
    expect(Day17._02("data/17")).to eql(2448)
  end
end
