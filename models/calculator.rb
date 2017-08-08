class Calculator
  attr_accessor :numbers, :input

  def initialize(input: InputIO)
    @numbers = []
    @input = input.new(self)
  end

  def perform(input_line)
    @input.perform input_line
  end
  
  def push(value)
    begin
      @numbers << Float(value)
    rescue
      puts "It is not a number. Please fill in with a number"
    end
  end

  def calculate(operator)
    begin
      second_value = @numbers.pop
      first_value = @numbers.pop

      raise ZeroDivisionError if second_value.zero? && operator.eql?('/')
      result = first_value.public_send("#{operator}".to_sym, second_value)
      push result
      puts result
    rescue NoMethodError
      @numbers.push second_value
      puts "Please fill in with a number"
    rescue ZeroDivisionError
      @numbers.push first_value
      puts "Divided by 0"
    end
  end
end
