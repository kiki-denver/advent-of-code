class Flight
  attr_reader :reindeer, :distance, :points

  def initialize(reindeer, speed, duration, recovery)
    @reindeer = reindeer
    @speed = speed
    @duration = duration
    @recovery = recovery
  end

  def ready_steady!
    @distance = 0
    @elapsed = 0
    @points = 0
  end

  def go!
    @distance += @speed if flying?
    @elapsed += 1
  end

  def good_job!
    @points += 1
  end

  private

  def flying?
    (@elapsed % (@duration + @recovery)) < @duration
  end
end

class Race
  FLIGHT_PATTERN = %r{(?<reindeer>.+) can fly (?<speed>\d+) km/s for (?<duration>\d+) seconds, but then must rest for (?<recovery>\d+) seconds\.}.freeze

  def initialize
    @flights = []
  end

  def enter(contestants)
    contestants.each do |contestant|
      matches = FLIGHT_PATTERN.match(contestant)

      @flights << Flight.new(
        matches[:reindeer],
        matches[:speed].to_i,
        matches[:duration].to_i,
        matches[:recovery].to_i,
      )
    end
  end

  def run_for_distance(time)
    run(time)
    @flights.max_by(&:distance)
  end

  def run_for_points(time)
    run(time)
    @flights.max_by(&:points)
  end

  private

  def run(time)
    @flights.each(&:ready_steady!)

    (1..time).each do |_t|
      @flights.each(&:go!)
      @flights.max_by(&:distance).good_job!
    end
  end
end

race = Race.new
race.enter(INPUT.split("\n"))

winner = race.run_for_distance(2503)
puts "The winner by distance is:", winner.reindeer, "#{winner.distance} km", nil

winner = race.run_for_points(2503)
puts "The winner by points is:", winner.reindeer, "#{winner.points} pts"
