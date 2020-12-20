require "day_15"

Day15 = Arihunta::AdventOfCode2020::Day15

describe Day15 do
  it "01-00" do
    expect(Day15._01("data/15-00")).to eql(436)
  end

  it "01" do
    expect(Day15._01("data/15")).to eql(1111)
  end

  it "02-00" do
    expect(Day15._02("data/15-00")).to eql(175594)
  end

  it "02" do
    expect(Day15._02("data/15")).to eql(48568)
  end
end
