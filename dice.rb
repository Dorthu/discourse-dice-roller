##
# A class representing Dice that can be rolled
class Dice
  ##
  # Create a new Dice object
  #
  # [sides] The number of side on the Dice
  # [include_sum] Whether to include the sum in +to_s+ output
  def initialize(sides, include_sum=true)
    @sides = sides.to_i
    @rolls = []
    @sum = 0
    @include_sum = include_sum
  end

  ##
  # Roll the Dice
  #
  # <b>Will be implicitly called with _1_ by +to_s+, if not called first</b>
  #
  # [times] How many times to roll the Dice, forced minimum is 1
  #
  # === Returns
  #
  # [self]  The Dice object itself is return to allow chaining
  def roll(times)
    times = times.to_i
    times = 1 if times < 1
    @rolls = []
    (1..times).each do |n|
      roll = rand(1..@sides)
      @rolls << roll
      @sum += roll
    end
    return self
  end

  ##
  # Overrides Object.to_s
  #
  # === Examples
  #
  #   d = Dice.new(6)
  #   d.roll(4).to_s
  #
  #   4d6: 1 + 4 + 3 + 5 = 13
  #
  #   d = Dice.new(20, false)
  #   d.rolls(2).to_s
  #
  #   2d20: 14 + 5
  def to_s
    roll(1) if @rolls.size < 1

    result = @rolls.size > 1 ? "#{@rolls.size}" : ""
    result += "d#{@sides}: #{@rolls.join(" + ")}"
    result += " = #{@sum}" if @include_sum and @rolls.size > 1
    return result
  end
end
