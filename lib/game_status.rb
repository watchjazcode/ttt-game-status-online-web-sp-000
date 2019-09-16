# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

# iterates nested array win_combinations and determines if 
# the same character is in all three spots for the combination
# returns one of the win_combinations lines
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return nil
end

#determines if the board is full
def full?(board)
  board.each do | board_cell |
    if board_cell == " " || board_cell == "" || board_cell == nil
      return false
    end
  end
  return true
end

# true if the board has not been won, but is full
# false if the board has not been won, and not full
# false if the board is won
def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !full?(board) && !won?(board)
    return false
  else won?(board)
    false
  end
end

#accepts a board and returns true if board is won, is a draw, or is full
def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

# method accepts a board and returns the token X or O that has won the game.
def winner(board)
  result = won?(board) # asking if there is a win
  if result == nil # if no winner
    return nil
  else
    index = result[0] #take array (win_combination) check one of the spaces
    return board[index] # return index character, which determines all 3 positions
  end
end



