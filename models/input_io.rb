class InputIO
  def initialize(calculator)
    @calculator = calculator
  end

  def perform
    ARGF.each_line do |line|
      menu line
    end
  end

  def menu(option)
    case option.chomp!
    when "+", "-", "*", "/"
      puts @calculator.calculate(option)
    when "q"
      exit 0
    else
      puts @calculator.push(option)
    end
  end
end
