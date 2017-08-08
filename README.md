# CLI RPN Calculator
It is a implementation of command-line reverse polish notation calculator using Ruby language.

Created a Calculator model to save numbers which were typed in the console and perform an operation when a operator is typed. 
The calculator will keep working until the letter "q" is typed.
Lines are always splited to works with an operations in line.
When the value typed is not a number, the calculator shows a message to the user, the same happens when the second number is 0, 
because it is not permitted.
## Requirements
 - Ruby
 - RSpec

## Installation
 ### Clone this project
 ```shell
 git clone git@github.com:rodrigoulisses/rpn_calculator.git
 ```

 ### Run bundler
 ```shell
 bundle install
 ```

## Runner specs
 ```shell
 rspec spec
 ```

## Runner code
 ```shell
 ruby main.rb
 ```
