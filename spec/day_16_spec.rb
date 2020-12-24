require "day_16"

Day16 = Arihunta::AdventOfCode2020::Day16

describe Day16 do
  it "01-00" do
    expect(Day16._01("data/16-00")).to eql(71)
  end

  it "01" do
    expect(Day16._01("data/16")).to eql(23954)
  end

  it "02-00" do
    expect(Day16._02("data/16-01")).to eql(nil)
  end

  it "02" do
    expect(Day16._02("data/16")).to eql(453459307723)
  end
end
