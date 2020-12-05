require "day_03"

Day03 = Arihunta::AdventOfCode2020::Day03

describe Day03 do
  it "01-00" do
    expect(Day03._01("data/03-00")).to eql(7)
  end

  it "01" do
    expect(Day03._01("data/03")).to eql(299)
  end

  it "02-00" do
    expect(Day03._02("data/03-00")).to eql(336)
  end

  it "02" do
    expect(Day03._02("data/03")).to eql(3621285278)
  end
end
