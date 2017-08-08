require 'spec_helper'
require_relative '../../models/input_io.rb'
require_relative '../../models/calculator.rb'

RSpec.describe InputIO do
  let(:calculator) { Calculator.new }
  subject { described_class.new calculator }

  describe '#perform' do
    context 'when input is number 4' do
      it 'changes calculator numbers by 1' do
        expect { subject.perform("4") }.to change(calculator.numbers, :size).by(1)
      end
    end

    context 'when input is 4 8 +' do
      specify { expect { subject.perform("4 8 +") }.to output(/12/).to_stdout }
    end

    context 'when calculator numbers is equal to [4 4]' do
      before do
        calculator.numbers = [4, 4]
      end

      context 'when input is -' do
        it 'changes size calculator numbers by 1' do
          expect { subject.perform('-') }.to change(calculator.numbers, :size).from(2).to(1)
        end

        specify { expect { subject.perform('-') }.to output(/0/).to_stdout }
      end
    end

    context 'when calculator numbers is equal to [4]' do
      before do
        calculator.numbers = [4]
      end

      context 'when input is 8 -' do
        specify { expect { subject.perform('8 -') }.to output(/-4/).to_stdout }
      end
    end
  end
end
