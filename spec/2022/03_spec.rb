require "spec_helper"

RSpec.describe "Day 3: Rucksack Reorganization" do
  let(:runner) { Runner.new("2022/03") }
  let(:input) do
    <<~TXT
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    TXT
  end

  describe "Part One" do
    let(:solution) { runner.execute!(input, part: 1) }

    it "calculates the sum of the misplaced items priorities across all rucksacks" do
      expect(solution).to eq(157)
    end
  end

  describe "Part Two" do
    let(:solution) { runner.execute!(input, part: 2) }

    it "calculates the sum of the group badge priorities" do
      expect(solution).to eq(70)
    end
  end
end
