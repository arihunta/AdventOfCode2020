require "day_07"

Day07 = Arihunta::AdventOfCode2020::Day07

describe Day07 do
  it "01-00" do
    expect(Day07._01("data/07-00")).to eql(4)
  end

  it "01" do
    expect(Day07._01("data/07")).to eql(246)
  end

  it "02-00" do
    expect(Day07._02("data/07-00")).to eql(32)
  end

  it "02-01" do
    expect(Day07._02("data/07-01")).to eql(126)
  end

  it "02" do
    expect(Day07._02("data/07")).to eql(2976)
  end
end
