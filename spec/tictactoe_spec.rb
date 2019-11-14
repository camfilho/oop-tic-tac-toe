# frozen_string_literal: true

require './lib/tic_tac_toe'
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
        expect { subject.type = 'i' }.to raise_error(
          NoMethodError
        )
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

RSpec.describe Board do
  describe '#initialize' do
    context 'When I create a new board' do
      subject { described_class.new }
      it 'returns the empty board with 1..9' do
        expect(subject.board).to eql((1..9).to_a)
      end

      it 'returns the available spots, starting with 1..9' do
        expect(subject.avail_squares).to eql(subject.board)
      end
    end
  end

  describe '#rows' do
    context 'When I display the rows' do
      subject { described_class.new }
      it 'returns the 3 set of rows in the tic-tac-toe game' do
        expect(subject.rows).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
      end
    end
  end

  describe '#columns' do
    context 'When I display the columns' do
      subject { described_class.new }
      it 'returns the 3 sets of columns in the tic-tac-toe game' do
        expect(subject.columns).to eql([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
      end
    end
  end

  describe '#diagonals' do
    context 'When I display the diagonals' do
      subject { described_class.new }
      it 'returns the 2 sets of diagonals in the tic-tac-toe game' do
        expect(subject.diagonals).to eql([[1, 5, 9], [3, 5, 7]])
      end
    end
  end

  describe '#move' do
    context 'When empty' do
      subject { described_class.new }
      it 'returns the new array containing the move' do
        subject.move('o', 4)
        subject.move('x', 3)
        expect(subject.board).to eql [1, 2, 'x', 'o', 5, 6, 7, 8, 9]
      end
    end
    context 'When not empty' do
      subject { described_class.new }
      it 'raise an exception if position taken' do
        subject.move('o', 4)
        expect { subject.move('x', 4) }.to raise_exception('Wrong coordinates')
      end
    end
  end

  describe '#empty?' do
    context 'When value is not valid' do
      subject { described_class.new }
      it 'will return false' do
        expect(subject.empty?(99)).to eql(false)
        expect(subject.empty?('a')).to eql(false)
      end
    end
    context 'When value is valid' do
      subject { described_class.new }
      it 'will return true' do
        expect(subject.empty?(9)).to eql(true)
        expect(subject.empty?(2)).to eql(true)
      end
    end
  end
end

RSpec.describe TicTacToe do
  describe '#check_winner' do
    context 'when the board is empty' do
      it 'returns false' do
        expect(subject.check_winner).to eql(false)
      end
    end
    context 'when there is a winner movement' do
      it 'returns true if x or o wins' do
        subject.board.move('x', 1)
        subject.board.move('x', 2)
        subject.board.move('x', 3)
        expect(subject.check_winner).to eql(true)
      end
    end
  end
  describe '#swtich player' do
    context 'when the turn is to the next player' do
      let(:old_player) { subject.current_player.dup }
      it 'switches player' do
        subject.switch_player
        expect(subject.current_player).to_not eql(old_player)
      end
    end
  end
end
