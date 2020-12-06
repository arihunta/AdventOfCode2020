require "day_06"

Day06 = Arihunta::AdventOfCode2020::Day06

describe Day06 do
  it "01-00" do
    expect(Day06._01("data/06-00")).to eql(11)
  end

  it "01" do
    expect(Day06._01("data/06")).to eql(6430)
  end

  it "02-00" do
    expect(Day06._02("data/06-00")).to eql(6)
  end

  it "02" do
    expect(Day06._02("data/06")).to eql(3125)
  end
end
