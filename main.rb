require_relative 'models/calculator'
require_relative 'models/input_io'

calculator = Calculator.new

ARGF.each_line do |line|
  calculator.perform line
end
