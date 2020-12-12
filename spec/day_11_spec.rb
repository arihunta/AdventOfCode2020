require "day_11"

Day11 = Arihunta::AdventOfCode2020::Day11

describe Day11 do
  it "01-00" do
    expect(Day11._01("data/11-00")).to eql(37)
  end

  it "01" do
    expect(Day11._01("data/11")).to eql(2211)
  end

  # it "02-00" do
  #   expect(Day11._02("data/11-00")).to eql(8)
  # end

  # it "02" do
  #   expect(Day11._02("data/11")).to eql(12401793332096)
  # end
end
