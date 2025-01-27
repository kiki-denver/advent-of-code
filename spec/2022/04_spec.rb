require "spec_helper"

RSpec.describe "Day 4: Challenge Title" do
  let(:runner) { Runner.new("2022/04") }
  let(:input) do
    <<~TXT
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    TXT
  end

  describe "Part One" do
    let(:solution) { runner.execute!(input, part: 1) }
    it "Calculates the number of assignment pairs where one range fully contains the other" do
      expect(solution).to eq(2)
    end
  end

  describe "Part Two" do
    let(:solution) { runner.execute!(input, part: 2) }
    it "Calculates the number of assignment pairs where one range overlaps with the other" do
      expect(solution).to eq(4)
    end
  end
end
