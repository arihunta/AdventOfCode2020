require "day_08"

Day08 = Arihunta::AdventOfCode2020::Day08

describe Day08 do
  it "01-00" do
    expect(Day08._01("data/08-00")).to eql(5)
  end

  it "01" do
    expect(Day08._01("data/08")).to eql(1384)
  end

  it "02-00" do
    expect(Day08._02("data/08-00")).to eql(8)
  end

  it "02" do
    expect(Day08._02("data/08")).to eql(761)
  end
end
