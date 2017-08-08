require 'spec_helper'
require_relative '../../models/calculator'
require_relative '../../models/input_io'

RSpec.describe Calculator do
  describe '#push' do
    context 'when does converts value to Float' do
      it 'adds value on numbers array' do
        expect { subject.push 4 }.to change(subject.numbers, :size).by(1)
      end
    end

    context 'when does not convert value to Float' do
      specify { expect { subject.push 'dadad' }.to output(/It is not a number. Please fill in with a number/).to_stdout }
    end
  end

  describe '#calculate' do
    before do
      subject.numbers = numbers
    end

    context 'there are two numbers' do
      let(:numbers) { [4,2] }

      context 'when operator is +' do
        specify { expect { subject.calculate('+') }.to output(/6/).to_stdout }
      end

      context 'when operator is /' do
        context 'when second value is not 0' do
          specify { expect { subject.calculate('/') }.to output(/2/).to_stdout }
        end

        context 'when second value is 0' do
          let(:numbers) { [4,0] }

          specify { expect { subject.calculate('/') }.to output(/Divided by 0/).to_stdout }
        end
      end
    end

    context 'there is one number' do
      let(:numbers) { [3] }
      specify { expect { subject.calculate('+') }.to output(/Please fill in with a number/).to_stdout }

      it 'does not change array' do
        expect { subject.calculate('+') }.to change(subject.numbers, :size).by(0)
      end
    end
  end
end
