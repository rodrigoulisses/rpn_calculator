class Calculator
  attr_accessor :inputs, :input

  def initialize(input: InputIO)
    @inputs = []
    @input = input.new(self)
  end

  def perform
    @input.perform
  end
  
  def push(value)
    begin
      @inputs << Float(value)

      value
    rescue
      "It is not a number. Please fill in with a number"
    end
  end

  def calculate(operator)
    begin
      second_value = @inputs.pop
      first_value = @inputs.pop

      raise ZeroDivisionError if second_value.zero? && operator.eql?('/')
      result = first_value.public_send("#{operator}".to_sym, second_value)
      push result
    rescue NoMethodError
      @inputs.push second_value
      "Please fill in with a number"
    rescue ZeroDivisionError
      @inputs.push first_value
      "Divided by 0"
    end
  end
end
