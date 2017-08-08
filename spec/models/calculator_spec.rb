require 'spec_helper'
require_relative '../../models/calculator'

RSpec.describe Calculator do
  describe '#push' do
    context 'when does converts value to Float' do
      it 'adds value on inputs array' do
        expect { subject.push 4 }.to change(subject.inputs, :size).by(1)
      end
    end

    context 'when does not convert value to Float' do
      it 'returns It is not a number' do
        expect(subject.push 'dadad').to eql 'It is not a number. Please fill in with a number'
      end
    end
  end

  describe '#calculate' do
    before do
      subject.inputs = inputs
    end

    context 'there are two numbers' do
      let(:inputs) { [4,2] }

      context 'when operator is +' do
        it 'returns sum of two number' do
          expect(subject.calculate('+')).to eql 6
        end
      end

      context 'when operator is /' do
        context 'when second value is not 0' do
          it 'returns 2' do
            expect(subject.calculate('/')).to eql 2
          end
        end

        context 'when second value is 0' do
          let(:inputs) { [4,0] }

          it 'returns Divided  by 0' do
            expect(subject.calculate('/')).to eql 'Divided by 0'
          end
        end
      end
    end

    context 'there is one number' do
      let(:inputs) { [3] }
      it 'returns messages' do
        expect(subject.calculate('+')).to eql 'Please fill in with a number'
      end

      it 'does not change array' do
        expect { subject.calculate('+') }.to change(subject.inputs, :size).by(0)
      end
    end
  end
end
