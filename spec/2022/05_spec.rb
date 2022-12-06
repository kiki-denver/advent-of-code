require "spec_helper"

RSpec.describe "Day 5: Challenge Title" do
  let(:runner) { Runner.new("2022/05") }
  let(:input) do
    <<~TXT
          [D]    
      [N] [C]    
      [Z] [M] [P]
       1   2   3 

      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    TXT
  end

  describe "Part One" do
    let(:solution) { runner.execute!(input, part: 1) }
    it "determines what crate ends up on top of each stack after the one at a time rearrangement procedure completes" do
      expect(solution).to eq("CMZ")
    end
  end

  describe "Part Two" do
    let(:solution) { runner.execute!(input, part: 2) }
    it "determines what crate ends up on top of each stack after the groups at a time rearrangement procedure completes" do
      expect(solution).to eq("MCD")
    end
  end
end
