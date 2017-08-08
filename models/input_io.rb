class InputIO
  def initialize(calculator)
    @calculator = calculator
  end

  def perform
    ARGF.each_line do |line|
      line.split(" ").map { |line| menu(line.chomp) }
    end
  end

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
