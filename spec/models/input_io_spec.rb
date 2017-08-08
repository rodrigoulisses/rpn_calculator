require 'spec_helper'
require_relative '../../models/input_io.rb'
require_relative '../../models/calculator.rb'

RSpec.describe InputIO do
  let(:calculator) { Calculator.new }
  subject { described_class.new calculator }

  describe '#menu' do
    after do
      subject.menu(option)
    end

    context 'when option is not operator nor q' do
      let(:option) { '3' }

      it 'calculator receives push with option as param' do
        expect(calculator).to receive(:push).with(option)
      end
    end

    context 'when options is an operator' do
      let(:option) { "+\n" }

      it 'calculator receives calculate with option as param' do
        expect(calculator).to receive(:calculate).with(option)
      end
    end

    context 'when option is q' do
      let(:option) { "q\n" }

      it 'exit to calculate' do
        expect(Kernel).to receive(:exit).with(0)
      end
    end
  end
end
