class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
        chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(length)
    # Code.new( Array.new(length, (POSSIBLE_PEGS.keys.sample)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(pegs_str)
    Code.new(pegs_str.split(""))
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map { |char| char.upcase }
    else
      raise 'invalid pegs'
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (self.pegs&guess.pegs).count
  end

  def num_near_matches(guess)
    original_pegs = []
    guess_pegs = []
    guess.pegs.each_with_index do |gpegs,idx|
      if gpegs != self.pegs[idx]
        original_pegs << self.pegs[idx]
        guess_pegs << gpegs
      end
    end
    (original_pegs&guess_pegs).count
  end

  def ==(code)
    self.pegs == code.pegs
  end
end
