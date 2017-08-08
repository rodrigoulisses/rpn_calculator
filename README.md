# CLI RPN Calculator
It is a implementation of command-line reverse polish notation calculator using Ruby language.

Created a Calculator model to save numbers that was typed on console and calculate an operation when a operator is typed on console. 
The calculator wait at working until that `q` is typed on console.
Lines are always splited to works with an operations in line.
When typed is not a number, the calculator show a message to user, the same happen when the second number is 0, because it is not permitted.

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
