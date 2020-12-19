require "day_13"

Day13 = Arihunta::AdventOfCode2020::Day13

describe Day13 do
  it "01-00" do
    expect(Day13._01("data/13-00")).to eql(295)
  end

  it "01" do
    expect(Day13._01("data/13")).to eql(102)
  end

  # it "02-00" do
  #   expect(Day13._02("data/13-00")).to eql(1068781)
  # end

  # it "02" do
  #   expect(Day13._02("data/13")).to eql(42013)
  # end
end
