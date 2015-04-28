require_relative 'strategies'

class PrimeByStrategy
  def is_prime?(input)
    Strategies::PRIME_STRATEGIES.map do |strategy|
      strategy.new(input)
    end.all?(&:prime?)
  end
end
