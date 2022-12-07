require "spec_helper"

RSpec.describe "Day 6: Tuning Trouble" do
  let(:runner) { Runner.new("2022/06") }
  let(:input) { "mjqjpqmgbljsphdztnvjfqwrcgsmlb" }
  let(:input2) { "bvwbjplbgvbhsrlpgdmjqwftvncz" }
  let(:input3) { "nppdvjthqldpwncqszvftbrmjlhg" }
  let(:input4) { "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" }
  let(:input5) { "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" }

  describe "Part One" do
    let(:solution) { runner.execute!(input, part: 1) }
    let(:solution2) { runner.execute!(input2, part: 1) }
    let(:solution3) { runner.execute!(input3, part: 1) }
    let(:solution4) { runner.execute!(input4, part: 1) }
    let(:solution5) { runner.execute!(input5, part: 1) }

    it "calculates number of characters before start-of-packet marker" do
      expect(solution).to eq(7)
      expect(solution2).to eq(5)
      expect(solution3).to eq(6)
      expect(solution4).to eq(10)
      expect(solution5).to eq(11)
    end
  end

  describe "Part Two" do
    let(:solution) { runner.execute!(input, part: 2) }
    let(:solution2) { runner.execute!(input2, part: 2) }
    let(:solution3) { runner.execute!(input3, part: 2) }
    let(:solution4) { runner.execute!(input4, part: 2) }
    let(:solution5) { runner.execute!(input5, part: 2) }

    it "calculates number of characters before start-of-message marker" do
      expect(solution).to eq(19)
      expect(solution2).to eq(23)
      expect(solution3).to eq(23)
      expect(solution4).to eq(29)
      expect(solution5).to eq(26)
    end
  end
end
