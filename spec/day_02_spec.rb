require "day_02"

Day02 = Arihunta::AdventOfCode2020::Day02

describe Day02 do
  it "01-00" do
    expect(Day02._01("data/02-00")).to eql(2)
  end

  it "01" do
    expect(Day02._01("data/02")).to eql(500)
  end

  it "02-00" do
    expect(Day02._02("data/02-00")).to eql(1)
  end

  it "02" do
    expect(Day02._02("data/02")).to eql(313)
  end
end
