require "day_01"

Day01 = Arihunta::AdventOfCode2020::Day01

describe Day01 do
  it "01-00" do
    expect(Day01._01("data/01-00")).to eql(514579)
  end

  it "01" do
    expect(Day01._01("data/01")).to eql(788739)
  end

  it "02-00" do
    expect(Day01._02("data/01-00")).to eql(241861950)
  end

  it "02" do
    expect(Day01._02("data/01")).to eql(178724430)
  end
end
