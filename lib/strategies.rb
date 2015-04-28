module Strategies
  class AbstractStrategy

    attr_reader :number

    def initialize(number)
      @number = number
    end

    def prime?
      !not_prime?
    end
  end

  class LessThanTwo < AbstractStrategy
    def not_prime?
      number < 2
    end
  end

  class IsEven < AbstractStrategy
    def not_prime?
      number > 2 && number.even?
    end
  end

  class HasIntegerSquareRoot < AbstractStrategy
    def not_prime?
      sqrt = Math.sqrt(number)
      sqrt == sqrt.floor
    end
  end

  class HasDivisor < AbstractStrategy
    def not_prime?
      sqrt = Math.sqrt(number).floor
      (3...sqrt).any? do |i|
        (number%i).zero?
      end
    end
  end

  PRIME_STRATEGIES =
    [Strategies::LessThanTwo,
     Strategies::IsEven,
     Strategies::HasIntegerSquareRoot,
     Strategies::HasDivisor]
end
