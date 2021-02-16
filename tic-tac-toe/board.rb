class Board
  @cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    puts %Q(
       #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
      ---+---+---
       #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
      ---+---+---
       #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
    )
  end

  def update_cell(index, value)
    @cells[index.to_i - 1] = value
  end
end