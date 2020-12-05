require "day_05"

Day05 = Arihunta::AdventOfCode2020::Day05

describe Day05 do
  it "01-00" do
    expect(Day05._01("data/05-00")).to eql(820)
  end

  it "01" do
    expect(Day05._01("data/05")).to eql(883)
  end

  it "02" do
    expect(Day05._02("data/05")).to eql(532)
  end
end
