class InputIO
  def initialize(calculator)
    @calculator = calculator
  end

  def perform(input)
    input.split(" ").map { |input| menu(input.chomp) }
  end

  private

  def menu(option)
    case option
    when "+", "-", "*", "/"
      @calculator.calculate(option)
    when "q"
      exit 0
    else
      @calculator.push(option)
    end
  end
end
