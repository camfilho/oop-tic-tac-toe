# frozen_string_literal: true

require './lib/users'
require './lib/board'

RSpec.describe Users do
  describe '#initialize' do
    context 'When I change the name or type of the user' do
      subject { described_class.new('Luis', 'o') }
      it 'returns the new name after call by name' do
        subject.name = 'Carlos'
        expect(subject.name).to eql('Carlos')
      end

      it 'should raise an error when changing type' do
        expect { subject.type = 'i' }.to raise_error(NoMethodError)
      end
    end
    context 'When I create a new User' do
      subject { described_class.new('Luis', 'o') }
      it 'returns Luis when I call by the name' do
        expect(subject.name).to eql('Luis')
      end

      it 'returns o when I call by the type' do
        expect(subject.type).to eql('o')
      end
    end
  end
end
