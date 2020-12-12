require "day_10"

Day10 = Arihunta::AdventOfCode2020::Day10

describe Day10 do
  it "01-00" do
    expect(Day10._01("data/10-00")).to eql(35)
  end

  it "01-01" do
    expect(Day10._01("data/10-01")).to eql(220)
  end

  it "01" do
    expect(Day10._01("data/10")).to eql(1700)
  end

  it "02-00" do
    expect(Day10._02("data/10-00")).to eql(8)
  end

  it "02-01" do
    expect(Day10._02("data/10-01")).to eql(19208)
  end

  it "02" do
    expect(Day10._02("data/10")).to eql(12401793332096)
  end
end
